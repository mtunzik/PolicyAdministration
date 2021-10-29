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
                                                    '"policy_policyversion"."Cover", '
                                                    '"policy_policyversion"."Status", "policy_policyversion"."id" '
                                                    'FROM "policy_policyversion" '
                                                    'INNER JOIN "policy_policy" '
                                                    'ON ("policy_policyversion"."Policy_id" = '
                                                    '"policy_policy"."id") INNER JOIN "clients_client" '
                                                    'ON ("policy_policy"."Client_id" = "clients_client"."id") '
                                                    'INNER JOIN "products_product" ON ("policy_policy"."Product_id" = '
                                                    '"products_product"."id") '
                                                    'ORDER BY "policy_policy"."id"')

    return render(request, 'policy.html', {'policies': policy_version_view})


@login_required(login_url='../authentication')
def policy_details(request, policy_version_id):
    policy_view = PolicyVersion.objects.raw('SELECT "policy_policy"."Number", "clients_client"."First_Name", '
                                                    '"clients_client"."Last_Name", "products_product"."Name", '
                                                    '"policy_policyversion"."Cover", "policy_policyversion"."CreatedBy_id",'
                                                    '"policy_policyversion"."Status", "policy_policyversion"."id" '
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

    print(datetime.now() + relativedelta(months=1))

    return render(request, 'policyDetails.html', {'policy': policy_view[0], 'policy_versions': policy_versions,
                                                  'members': policy_members, 'userid': request.user.id,
                                                  'ledgers': ledgers})


@login_required(login_url='../authentication')
def add(request):
    form = AddPolicy()
    if request.method == 'POST':
        form = AddPolicy(request.POST)

        if form.is_valid():
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

            rates = ProductRates.objects.get(Product_id=product_id, Description__contains=cover,
                                             AgeTo__gte=age, AgeFrom__lte=age)
            premium = 0.0

            if cover == 'Price Per R 1,000':
                premium = float(cover_amount)/1000.0 * float(rates.Rate)
            else:
                premium = rates.Rate

            main_member = PolicyMembers(MemberType='Maim Member', First_Name=client.First_Name,
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

                rates = ProductRates.objects.get(Description__contains=description, AgeFrom__lte=age,
                                                 AgeTo__gte=age)
                premium = rates.Rate
                if cover == 'Price Per R 1,000':
                    premium = float(cover_amount)/1000.0 * float(rates.Rate)

            member = form.save(commit=False)
            member.PolicyVersion_id = policy_version_id
            member.Premium = premium
            if member_type == 'Adult Dependent':
                member.Cover = cover
                member.CoverAmount = cover_amount

            member.save()
            return redirect('/policy/policy_details/' + str(policy_version_id))
        else:
            print(form.errors)
    context = {'form': form}
    return render(request, 'addMember.html', context)


@login_required(login_url='../authentication')
def edit_member(request, member_id):
    member = PolicyMembers.objects.get(id=member_id)
    form = AddPolicyMembers(instance=member)
    print(member.Cover)
    if request.method == 'POST':
        form = AddPolicyMembers(request.POST, instance=member)
        if form.is_valid():
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

                rates = ProductRates.objects.get(Description__contains=description, AgeFrom__lte=age,
                                                 AgeTo__gte=age)
                premium = rates.Rate

            member = form.save(commit=False)
            member.Premium = premium
            if member_type == 'Adult Dependent':
                member.Cover = cover
                member.CoverAmount = cover_amount

            member.save()
            return redirect('/policy/policy_details/' + str(member.PolicyVersion_id))

    context = {'form': form, 'cover': str(member.Cover)}
    return render(request, 'addMember.html', context)


def approve(request, policy_version_id):
    policy_version = PolicyVersion.objects.get(id=policy_version_id)
    policy_version.Status = 'Finalised'
    policy_version.ApprovedBy_id = request.user.id
    policy_version.save()

    policy = Policy.objects.get(id=policy_version.Policy_id)
    collection_date = datetime(timezone.now().date().year, timezone.now().date().month, policy.CollectionDay)
    amount = PolicyMembers.objects.filter(PolicyVersion_id=policy_version_id).aggregate(Sum('Premium'))['Premium__sum']
    ledger = PolicyLedger(Amount=amount, TransactionDate=timezone.now().date(), CollectionDate=collection_date.date(),
                          PolicyVersion_id=policy_version_id)
    ledger.save()

    return redirect('/policy/policy_details/' + str(policy_version_id))


def decline(request, policy_version_id):
    policy_version = PolicyVersion.objects.get(id=policy_version_id)
    policy_version.Status = 'Declined'
    policy_version.DeclinedBy = request.user.id
    policy_version.save()

    return redirect('/policy/policy_details/' + str(policy_version_id))


def raise_ledger(request, policy_version_id):
    policy_version = PolicyVersion.objects.get(id=policy_version_id)
    policy = Policy.objects.get(id=policy_version.Policy_id)
    policy_ledger = PolicyLedger.objects.filter(PolicyVersion_id=policy_version_id)
    print(policy_ledger.aggregate(Max('CollectionDate'))['CollectionDate__max'])
    transaction_date = policy_ledger.aggregate(Max('TransactionDate'))['TransactionDate__max']
    collection_date = policy_ledger.aggregate(Max('CollectionDate'))['CollectionDate__max']
    new_transaction_date = transaction_date + relativedelta(months=1)
    new_collection_date = collection_date + relativedelta(months=1)
    print(new_transaction_date)
    print(new_collection_date)
    amount = PolicyMembers.objects.filter(PolicyVersion_id=policy_version_id).aggregate(Sum('Premium'))['Premium__sum']
    ledger = PolicyLedger(Amount=amount, TransactionDate=new_transaction_date, CollectionDate=new_collection_date,
                          PolicyVersion_id=policy_version_id)
    ledger.save()

    return redirect('/policy/policy_details/' + str(policy_version_id))


def edit_policy(request, policy_version_id):
    form = AddPolicyVersion()
    policy_version = PolicyVersion.objects.get(id=policy_version_id)
    policy_version.Status = 'Un-finalised'
    policy_version.IsLatest = False
    policy_version.save()

    policy = Policy.objects.get(id=policy_version.Policy_id)

    context = {'form': form}
    return render(request, 'addPolicyVersion.html', context)