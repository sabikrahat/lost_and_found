from django.shortcuts import render

# Create your views here.


def home(request):
    return render(request, 'home.html')


def authenticate(request):
    return render(request, 'authenticate.html')


def privacy_policy(request):
    return render(request, 'privacy_policy.html')
    
def terms_and_conditions(request):
    return render(request, 'terms_and_conditions.html')