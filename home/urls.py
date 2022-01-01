from django.urls import path
from home import views

urlpatterns = [
    path('rahat', views.rahat, name='rahat'),
    path('humaira', views.humaira, name='humaira'),
    path('kawshik', views.kawshik, name='kawshik'),
    path('', views.home, name="home"),
    path('admin-login', views.admin_login, name="admin-login"),
    path('admin-panel', views.admin_panel, name="admin-panel"),
    path('authenticate', views.authenticate, name="authenticate"),
    path('signup', views.signup, name='signup'),
    path('login', views.login, name='login'),
    path('logout', views.logout, name='logout'),
    path('privacy-policy', views.privacy_policy, name="privacy-policy"),
    path('terms-and-conditions', views.terms_and_conditions, name="terms-and-conditions"),
    path('contact', views.contact, name="contact"),
    path('write-post', views.write_post, name="write-post"),
    path('feedback', views.feedback, name="feedback"),
    path('view-profile', views.view_profile, name="view-profile"),
    path('edit-profile', views.edit_profile, name="edit-profile"),
    path('forget-password', views.forget_password, name='forget-password'),
    path('change-password/<token>/', views.change_password, name='change-password'),
    path('view-post/<token>/', views.view_post, name='view-post'),
    path('point-purchase', views.point_purchase, name='point-purchase'),
    path('point-add/<token>/', views.point_add, name='point-add'),
    path('claim-owner/<token>/', views.claim_owner, name='claim-owner'),
]
