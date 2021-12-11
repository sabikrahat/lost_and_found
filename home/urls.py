from django.urls import path
from home import views

urlpatterns = [
    path('', views.home, name="home"),
    path('authenticate', views.authenticate, name="authenticate"),
    path('signup', views.signup, name='signup'),
    path('login', views.login, name='login'),
    path('logout', views.logout, name='logout'),
    path('privacy-policy', views.privacy_policy, name="privacy-policy"),
    path('terms-and-conditions', views.terms_and_conditions,
         name="terms-and-conditions"),
    path('contact', views.contact, name="contact"),
    path('feedback', views.feedback, name="feedback"),
    path('view-profile', views.view_profile, name="view-profile"),
    path('edit-profile', views.edit_profile, name="edit-profile"),
    path('forget-password', views.forget_password, name='forget-password'),
    path('change-password/<token>/', views.change_password, name='change-password'),
]
