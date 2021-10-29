from django.urls import path
from . import views

urlpatterns = [
    path('add_payment/<str:ledger_id>/', views.add_payment)
]

