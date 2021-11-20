from django.shortcuts import render

# Create your views here.


def home(request):
    return render(request, 'home.html')


def authenticate(request):
    return render(request, 'authenticate.html')
