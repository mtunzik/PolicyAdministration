from django.db.models.functions import Coalesce
from django.db.models import Sum, Max
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import *
from .forms import *
from datetime import date, datetime
from django.utils import timezone
from django.contrib import messages
from dateutil.relativedelta import relativedelta


@login_required(login_url='../authentication')
def index(request):
    policy_version_view = PolicyVersion.objects.raw('SELECT "policy_policy"."Number", "clients_client"."First_Name", '
                                                    '"clients_client"."Last_Name", "products_product"."Name", '
                                                    '"policy_policyversion"."DateAdded", '
                                                    '"policy_policyversion"."Cover", '
                                                    '"policy_policyversion"."Status", "policy_policyversion"."id" '
                                                    'FROM "policy_policyversion" '
                                                    'INNER JOIN "policy_policy" '
                                                    'ON ("policy_policyversion"."Policy_id" = '
                                                    '"policy_policy"."id") INNER JOIN "clients_client" '
                                                    'ON ("policy_policy"."Client_id" = "clients_client"."id") '
                                                    'INNER JOIN "products_product" ON ("policy_policy"."Product_id" = '
                                                    '"products_product"."id") '
                                                    'WHERE "IsLatest" = True '
                                                    'ORDER BY "policy_policy"."id"')

    return render(request, 'policy.html', {'policies': policy_version_view})


@login_required(login_url='../authentication')
def policy_details(request, policy_version_id):
    policy_view = PolicyVersion.objects.raw('SELECT "policy_policy"."Number", "clients_client"."First_Name", '
                                                    '"clients_client"."Last_Name", "products_product"."Name", '
                                                    '"policy_policyversion"."Cover", "policy_policyversion"."CreatedBy_id",'
                                                    '"policy_policyversion"."Status", "policy_policyversion"."id", '
                                                    '"policy_policyversion"."IsLatest" '
                                                    'FROM "policy_policyversion" '
                                                    'INNER JOIN "policy_policy" '
                                                    'ON ("policy_policyversion"."Policy_id" = '
                                                    '"policy_policy"."id") INNER JOIN "clients_client" '
                                                    'ON ("policy_policy"."Client_id" = "clients_client"."id") '
                                                    'INNER JOIN "products_product" ON ("policy_policy"."Product_id" = '
                                                    '"products_product"."id") '
                                            'WHERE "policy_policyversion"."id" = %i' % int(policy_version_id))

    policy_version = PolicyVersion.objects.filter(id=policy_version_id)
    policy_versions = PolicyVersion.objects.filter(Policy_id=policy_version[0].Policy_id)
    policy_members = PolicyMembers.objects.filter(PolicyVersion_id=policy_version_id)
    ledgers = PolicyLedger.objects.raw('SELECT l.id, "l"."Amount", "l"."TransactionDate", '
                                    '"l"."CollectionDate", "pl"."Amount" as "AmountPaid" '
                                    'FROM policy_policyledger as l '
                                    'INNER JOIN policy_policyversion as pv '
                                    'ON "l"."PolicyVersion_id" = pv.id '
                                    'INNER JOIN policy_policy as "p" '
                                    'ON "pv"."Policy_id" = "p".id '
                                    'LEFT JOIN '
                                    '(SELECT "PolicyLedger_id", SUM("Amount") "Amount" '
                                     'FROM accounts_paymentledger GROUP BY "PolicyLedger_id") as pl '
                                    'ON l.id = "pl"."PolicyLedger_id" '
                                    'WHERE "p"."id" = %a ORDER BY "l"."TransactionDate"' % int(policy_version[0].Policy_id))

    return render(request, 'policyDetails.html', {'policy': policy_view[0], 'policy_versions': policy_versions,
                                                  'members': policy_members, 'userid': request.user.id,
                                                  'ledgers': ledgers})


@login_required(login_url='../authentication')
def add(request):
    form = AddPolicy()
    if request.method == 'POST':
        form = AddPolicy(request.POST)

        if form.is_valid():
            error_count = 0
            inception_date = form.cleaned_data['InceptionDate']
            collection_day = form.cleaned_data['CollectionDay']
            product_id = request.POST.get('Product')
            client_id = request.POST.get('Client')
            cover = request.POST.get('Cover')
            cover_amount = form.cleaned_data['CoverAmount']
            product_object = Product.objects.get(id=product_id)
            product_code = product_object.Code
            policy_id = 0

            if Policy.objects.filter(Product_id=product_id).exists():
                policy = Policy.objects.filter(Product_id=product_id).order_by('id').last()
                policy_id = policy.id

            policy_number = str(product_code) + str(datetime.now().year) + str(policy_id + 1)
            new_policy = Policy(Number=policy_number, InceptionDate=inception_date, CollectionDay=collection_day,
                                Product_id=product_id, Client_id=client_id, DateAdded=timezone.now())
            new_policy.save()
            new_policy_version = PolicyVersion(EndorsementType='Inception', EndorsementReason='Inception',
                                               EffectiveDateFrom=new_policy.InceptionDate,
                                               EffectiveDateTo=date(new_policy.InceptionDate.year + 100,
                                                                    new_policy.InceptionDate.month,
                                                                    new_policy.InceptionDate.day),
                                               Description='Inception', Cover=cover, CoverAmount=cover_amount,
                                               DateAdded=timezone.now(), Policy_id=new_policy.id,
                                               CreatedBy_id=request.user.id)
            new_policy_version.save()

            client = Client.objects.get(id=client_id)
            dob = client.DateOfBirth
            today = date.today()
            age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
            rates = 0.0
            if ProductRates.objects.filter(Product_id=product_id, Description__contains=cover,
                                             AgeTo__gte=age, AgeFrom__lte=age).exists():
                rates = ProductRates.objects.get(Product_id=product_id, Description__contains=cover,
                                                 AgeTo__gte=age, AgeFrom__lte=age)
            else:
                error_count = error_count + 1
                messages.error(request, 'rate does not exist')

            premium = 0.0

            if cover == 'Price Per R 1,000':
                premium = float(cover_amount)/1000.0 * float(rates.Rate)
            else:
                premium = rates.Rate
            if error_count == 0:
                main_member = PolicyMembers(MemberType='Main Member', First_Name=client.First_Name,
                                            Last_Name=client.Last_Name, Gender=client.Gender,
                                            DateOfBirth=client.DateOfBirth, ID_Type=client.ID_Type,
                                            ID_Number=client.ID_Number, Title=client.Title,
                                            PolicyVersion=new_policy_version, Student=False, Cover=cover,
                                            CoverAmount=cover_amount,   Premium=premium)
                main_member.save()

                return redirect('/policy')

    context = {'form': form}
    return render(request, 'addPolicy.html', context)


@login_required(login_url='../authentication')
def add_member(request, policy_version_id):
    form = AddPolicyMembers()
    policy_version = PolicyVersion.objects.get(id=policy_version_id)

    if request.method == 'POST':
        form = AddPolicyMembers(request.POST)
        if form.is_valid():
            error_count = 0
            dob = form.cleaned_data['DateOfBirth']
            member_type = form.cleaned_data['MemberType']
            cover = form.cleaned_data['Cover']
            cover_amount = form.cleaned_data['CoverAmount']
            today = date.today()
            age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
            premium = 0

            if member_type == 'Adult Dependent':
                description = ''
                if cover == 'Option 1: R 5,000':
                    description = 'Adult Dependent Option 1: R 5,000'
                elif cover == 'Option 2: R 10,000':
                    description = 'Adult Dependent Option 2: R 10,000'
                elif cover == 'Price Per R 1,000':
                    description = 'Adult Dependent Price Per R 1,000'

                if ProductRates.objects.filter(Description__contains=description, AgeFrom__lte=age,
                                                 AgeTo__gte=age).exists():
                    rates = ProductRates.objects.get(Description__contains=description, AgeFrom__lte=age,
                                                 AgeTo__gte=age)
                    premium = rates.Rate
                else:
                    error_count = error_count + 1
                    messages.error(request, 'rate does not exist')

                if cover == 'Price Per R 1,000':
                    premium = float(cover_amount)/1000.0 * float(rates.Rate)

            if error_count == 0:
                member = form.save(commit=False)
                member.PolicyVersion_id = policy_version_id
                member.Premium = premium
                if member_type == 'Adult Dependent':
                    member.Cover = cover
                    member.CoverAmount = cover_amount

                member.save()
                return redirect('/policy/policy_details/' + str(policy_version_id))

    context = {'form': form, 'PolicyVersion': policy_version}
    return render(request, 'addMember.html', context)


@login_required(login_url='../authentication')
def edit_member(request, member_id):
    member = PolicyMembers.objects.get(id=member_id)
    form = AddPolicyMembers(instance=member)
    policy_version = PolicyVersion.objects.get(id=member.PolicyVersion_id)

    if request.method == 'POST':
        form = AddPolicyMembers(request.POST, instance=member)
        if form.is_valid():
            error_count = 0
            dob = form.cleaned_data['DateOfBirth']
            member_type = form.cleaned_data['MemberType']
            cover = form.cleaned_data['Cover']
            cover_amount = form.cleaned_data['CoverAmount']
            today = date.today()
            age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
            premium = 0

            if member_type == 'Adult Dependent':
                description = ''
                if cover == 'Option 1: R 5,000':
                    description = 'Adult Dependent Option 1: R 5,000'
                elif cover == 'Option 2: R 10,000':
                    description = 'Adult Dependent Option 2: R 10,000'
                elif cover == 'Price Per R 1,000':
                    description = 'Adult Dependent Price Per R 1,000'

                if ProductRates.objects.filter(Description__contains=description, AgeFrom__lte=age,
                                                 AgeTo__gte=age).exists():
                    rates = ProductRates.objects.get(Description__contains=description, AgeFrom__lte=age,
                                                     AgeTo__gte=age)
                    premium = rates.Rate
                else:
                    error_count = error_count + 1
                    messages.error(request, 'rate does not exist')
            if error_count == 0:
                member = form.save(commit=False)
                member.Premium = premium
                if member_type == 'Adult Dependent':
                    member.Cover = cover
                    member.CoverAmount = cover_amount

                member.save()
                return redirect('/policy/policy_details/' + str(member.PolicyVersion_id))

    context = {'form': form, 'cover': str(member.Cover), 'memberId': member_id, 'PolicyVersion': policy_version}
    return render(request, 'addMember.html', context)


@login_required(login_url='../authentication')
def delete_member(request, member_id):
    member = PolicyMembers.objects.get(id=member_id)
    policy_version_id = member.PolicyVersion_id
    member.delete()
    return redirect('/policy/policy_details/' + str(policy_version_id))


def approve(request, policy_version_id):
    policy_version = PolicyVersion.objects.get(id=policy_version_id)
    policy_version.Status = 'Finalised'
    policy_version.ApprovedBy_id = request.user.id
    policy_version.save()

    if policy_version.EndorsementType == 'Inception':
        policy = Policy.objects.get(id=policy_version.Policy_id)
        transaction_date = policy.InceptionDate
        collection_date = datetime(policy.InceptionDate.year, policy.InceptionDate.month, policy.CollectionDay)
        amount = PolicyMembers.objects.filter(PolicyVersion_id=policy_version_id).aggregate(Sum('Premium'))['Premium__sum']
        ledger = PolicyLedger(Amount=amount, TransactionDate=transaction_date, CollectionDate=collection_date,
                              PolicyVersion_id=policy_version_id)
        ledger.save()

        while transaction_date < datetime.now().date():
            transaction_date = transaction_date + relativedelta(months=1)
            collection_date = collection_date + relativedelta(months=1)
            ledger = PolicyLedger(Amount=amount, TransactionDate=transaction_date, CollectionDate=collection_date,
                                  PolicyVersion_id=policy_version_id)
            ledger.save()

    return redirect('/policy/policy_details/' + str(policy_version_id))


def decline(request, policy_version_id):
    policy_version = PolicyVersion.objects.get(id=policy_version_id)
    policy_version.Status = 'Declined'
    policy_version.DeclinedBy = request.user
    policy_version.save()

    return redirect('/policy/policy_details/' + str(policy_version_id))


def raise_ledger(request, policy_version_id):
    policy_version = PolicyVersion.objects.get(id=policy_version_id)
    policy_ledger = PolicyLedger.objects.filter(PolicyVersion__Policy_id=policy_version.Policy_id)
    transaction_date = policy_ledger.aggregate(Max('TransactionDate'))['TransactionDate__max']
    collection_date = policy_ledger.aggregate(Max('CollectionDate'))['CollectionDate__max']
    new_transaction_date = transaction_date + relativedelta(months=1)
    new_collection_date = collection_date + relativedelta(months=1)

    amount = PolicyMembers.objects.filter(PolicyVersion_id=policy_version_id).aggregate(Sum('Premium'))['Premium__sum']
    ledger = PolicyLedger(Amount=amount, TransactionDate=new_transaction_date, CollectionDate=new_collection_date,
                          PolicyVersion_id=policy_version_id)
    ledger.save()

    return redirect('/policy/policy_details/' + str(policy_version_id))


def edit_policy(request, policy_version_id):
    policy_version = PolicyVersion.objects.get(id=policy_version_id)
    form = AddPolicyVersion(instance=policy_version)
    if request.method == 'POST':
        form = AddPolicyVersion(request.POST)

        if form.is_valid():
            error_count = 0
            effective_date = form.cleaned_data['EffectiveDateFrom']
            cover = request.POST.get('Cover')
            cover_amount = form.cleaned_data['CoverAmount']
            description = form.cleaned_data['Description']
            endorsement_type = request.POST.get('EndorsementType')

            policy_version.Status = 'Un-finalised'
            policy_version.IsLatest = False
            policy_version.EffectiveDateTo = effective_date
            policy_version.save()

            policy = Policy.objects.get(id=policy_version.Policy_id)
            product_id = policy.Product_id
            new_policy_version = form.save(commit=False)
            new_policy_version.Version_Number = policy_version.Version_Number + 1
            new_policy_version.EndorsementType = endorsement_type
            new_policy_version.EndorsementReason = endorsement_type
            new_policy_version.EffectiveDateTo = date(effective_date.year + 100,
                                                      effective_date.month,
                                                      effective_date.day)

            for member in PolicyMembers.objects.filter(PolicyVersion_id=policy_version_id):
                dob = member.DateOfBirth
                today = date.today()
                age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
                if member.Cover != cover:
                    if member.MemberType == 'Main Member':
                        if not ProductRates.objects.filter(Product_id=product_id, Description__contains=cover,
                                                     AgeTo__gte=age, AgeFrom__lte=age).exists():
                            error_count = error_count + 1
                            messages.error(request, 'rate does not exist')

            if error_count == 0:
                new_policy_version.Cover = cover
                new_policy_version.CoverAmount = cover_amount
                new_policy_version.DateAdded = timezone.now()
                new_policy_version.Policy_id = policy_version.Policy_id
                new_policy_version.CreatedBy_id = request.user.id
                new_policy_version.IsLatest = True
                new_policy_version.Description = description
                if endorsement_type == 'Cancellation':
                    new_policy_version.Status = 'Cancelled'
                    new_policy_version.save()
                else:
                    new_policy_version.Status = 'Un-finalised'
                    new_policy_version.save()

                for member in PolicyMembers.objects.filter(PolicyVersion_id=policy_version_id):
                    dob = member.DateOfBirth
                    today = date.today()
                    age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))

                    if member.Cover != new_policy_version.Cover:
                        if member.MemberType == 'Main Member':
                            cover = new_policy_version.Cover
                            rates = ProductRates.objects.get(Product_id=product_id, Description__contains=cover,
                                                     AgeTo__gte=age, AgeFrom__lte=age)

                            if cover == 'Price Per R 1,000':
                                premium = float(cover_amount) / 1000.0 * float(rates.Rate)
                            else:
                                premium = rates.Rate
                        else:
                            cover = member.Cover
                            cover_amount = member.CoverAmount
                            premium = member.Premium

                    else:
                        cover = member.Cover
                        cover_amount = member.CoverAmount
                        premium = member.Premium

                    new_member = PolicyMembers(MemberType=member.MemberType, First_Name=member.First_Name,
                                            Last_Name=member.Last_Name, Gender=member.Gender,
                                            DateOfBirth=member.DateOfBirth, ID_Type=member.ID_Type,
                                            ID_Number=member.ID_Number, Title=member.Title,
                                            PolicyVersion=new_policy_version, Student=member.Student, Cover=cover,
                                            CoverAmount=cover_amount,   Premium=premium)
                    new_member.save()

                return redirect('/policy/policy_details/' + str(new_policy_version.id))

    context = {'form': form}
    return render(request, 'addPolicyVersion.html', context)