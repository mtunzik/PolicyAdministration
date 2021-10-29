from django.urls import path
from . import views

urlpatterns = [
    path('', views.login_page),
    path('logout', views.logout_user),
    path('register', views.register),
    path('forgot-password', views.forgot_password)
]