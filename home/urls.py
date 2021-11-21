from django.urls import path
from home import views

urlpatterns = [
    path('', views.home, name="home"),
    
    path('authenticate', views.authenticate, name="authenticate"),
    
    path('privacy_policy', views.privacy_policy, name="privacy_policy"),
    
    path('terms_and_conditions', views.terms_and_conditions, name="terms_and_conditions"),
    path('feedback', views.feedback, name="feedback"),
]
