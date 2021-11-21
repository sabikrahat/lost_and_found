from django.shortcuts import render

# Create your views here.


def home(request):
    return render(request, 'navbar.html')


def authenticate(request):
    return render(request, 'authenticate.html')

# def navbar(request):
#     return render(request, 'navbar.html')