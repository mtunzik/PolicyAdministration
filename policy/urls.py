from django.urls import path
from . import views
from django.contrib import admin
from django.contrib import admin


admin.site.site_header = "Admin Central"

urlpatterns = [
    path('', views.index),
    path('policy_details/<str:policy_version_id>/', views.policy_details),
    path('add', views.add),
    path('add_member/<str:policy_version_id>/', views.add_member),
    path('edit_policy/<str:policy_version_id>/', views.edit_policy),
    path('edit_member/<str:member_id>/', views.edit_member),
    path('approve/<str:policy_version_id>/', views.approve),
    path('decline/<str:policy_version_id>/', views.decline),
    path('raise_ledger/<str:policy_version_id>/', views.raise_ledger)

]

