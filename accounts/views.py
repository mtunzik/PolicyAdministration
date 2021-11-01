from django.shortcuts import render, redirect
from policy.models import PolicyVersion, Policy
from .forms import *
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from datetime import datetime
from dateutil.relativedelta import relativedelta
from django.db.models import Sum


@login_required(login_url='../authentication')
def add_payment(request, ledger_id):
    form = AddPayment()
    if request.method == 'POST':
        form = AddPayment(request.POST)

        if form.is_valid():
            ledger = PolicyLedger.objects.get(id=ledger_id)
            policy_version_id = ledger.PolicyVersion_id
            policy_version = PolicyVersion.objects.get(id=policy_version_id)
            policy_id = policy_version.Policy_id
            policy = Policy.objects.get(id=policy_id)
            client_id = policy.Client_id
            receipt = form.save(commit=False)
            receipt.Client_id = client_id
            receipt.save()

            amount_paid = 0.00
            number_of_ledgers_to_raise = 0
            total_receipt_amount = receipt.Amount
            ledger_amount = ledger.Amount
            total_amount_paid = 0.00
            if PaymentLedger.objects.filter(PolicyLedger_id=ledger_id).exists():
                total_amount_paid = PaymentLedger.objects.filter(PolicyLedger_id=ledger_id).aggregate(Sum('Amount'))['Amount__sum']

            if total_receipt_amount <= ledger_amount:
                if total_amount_paid > 0.00:
                    if total_receipt_amount + total_amount_paid <= ledger_amount:
                        amount_paid = total_receipt_amount
                    else:
                        amount_paid = ledger_amount - total_amount_paid
                else:
                    amount_paid = total_receipt_amount

            else:
                if total_amount_paid > 0.00:
                    amount_paid = ledger_amount - total_amount_paid
                else:
                    amount_paid = ledger.Amount

            payment_ledger = PaymentLedger(Amount=amount_paid, Receipt_id=receipt.id, PolicyLedger_id=ledger_id)
            payment_ledger.save()
            total_receipt_amount = total_receipt_amount - amount_paid

            if float(total_receipt_amount) + float(total_amount_paid) > ledger_amount:
                collection_date = ledger.CollectionDate
                transaction_date = ledger.TransactionDate

                while total_receipt_amount > 0:
                    if total_receipt_amount >= ledger_amount:
                        amount = ledger_amount
                    else:
                        amount = total_receipt_amount

                    collection_date = collection_date + relativedelta(months=1)
                    transaction_date = transaction_date + relativedelta(months=1)

                    if not PolicyLedger.objects.filter(TransactionDate=transaction_date,
                                                    PolicyVersion_id=policy_version_id).exists():
                        ledger = PolicyLedger(Amount=ledger_amount, TransactionDate=transaction_date,
                                              CollectionDate=collection_date,
                                              PolicyVersion_id=policy_version_id)
                        ledger.save()
                    else:
                        ledger = PolicyLedger.objects.get(TransactionDate=transaction_date,
                                                          PolicyVersion_id=policy_version_id)
                        collection_date = ledger.CollectionDate
                        transaction_date = ledger.TransactionDate

                    payment_ledger = PaymentLedger(Amount=amount, Receipt_id=receipt.id, PolicyLedger_id=ledger.id)
                    payment_ledger.save()

                    total_receipt_amount = total_receipt_amount - amount

            return redirect('/policy/policy_details/' + str(policy_version_id))

    context = {'form': form}
    return render(request, 'addPayment.html', context)
