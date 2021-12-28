from django.urls import path
from home import views

urlpatterns = [
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
    path('location', views.location, name="location"),
    path('write-post', views.write_post, name="write-post"),
    path('feedback', views.feedback, name="feedback"),
    path('test', views.test, name="test"),
    path('view-profile', views.view_profile, name="view-profile"),
    path('edit-profile', views.edit_profile, name="edit-profile"),
    path('forget-password', views.forget_password, name='forget-password'),
    path('new_home', views.new_home, name='new_home'),
    path('card', views.post_card, name='card'),
    path('change-password/<token>/', views.change_password, name='change-password'),
]
