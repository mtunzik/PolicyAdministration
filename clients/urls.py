from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('add', views.add),
    path('edit/<str:pk>/', views.edit),
    path('delete/<str:pk>/', views.delete)
]