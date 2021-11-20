from django.urls import path
from home import views

urlpatterns = [
    path('', views.home, name="home"),
    path('authenticate', views.authenticate, name="authenticate"),
    path('register', views.register, name="register"),
]
