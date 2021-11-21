from django.shortcuts import redirect, render
from home.models import UserModel
from django.contrib.auth.hashers import make_password
from django.contrib.auth.hashers import check_password
from django.contrib import messages

# Create your views here.


def home(request):
    return render(request, 'home.html')


def authenticate(request):
    return render(request, 'authenticate.html')


def signup(request):
    context = {}
    if request.method == 'POST':
        if request.POST.get('name') and request.POST.get('email') and request.POST.get('password') and request.POST.get('phoneNumber') and request.POST.get('location') and request.POST.get('password'):
            saveUser = UserModel()
            # saveToken = Profile()

            t_email = request.POST.get('email')

            saveUser.name = request.POST.get('name')
            saveUser.email = request.POST.get('email')
            saveUser.password = make_password(request.POST.get('password'))
            saveUser.phoneNumber = request.POST.get('phoneNumber')
            saveUser.location = request.POST.get('location')
            saveUser.point = '100'

            if saveUser.isExists():
                messages.error(
                    request, t_email + " email address already registered...! Please Log in.")
                # return render(request, 'authenticate.html', context)
                return redirect('../authenticate')
            else:
                saveUser.save()
                # saveToken.user = saveRecord
                # saveToken.save()
                messages.success(
                    request, "Hello " + request.POST.get('name') + ", registration details saved successfully...! Please Log in now.")
                return redirect('../authenticate')

    else:
        return redirect('../authenticate')


def login(request):
    context = {}
    if request.method == 'POST':
        try:
            userDetail = UserModel.objects.get(
                email=request.POST.get('email'))
            if check_password(request.POST.get('password'), (userDetail.password)):
                request.session['email'] = userDetail.email
                return redirect('/')
            else:
                messages.error(
                    request, 'Password incorrect...!')
        except UserModel.DoesNotExist as e:
            messages.error(
                request, 'No user found of this email....!')

    return redirect('../authenticate')


def logout(request):
    try:
        del request.session['email']
        messages.success(request, "Successfully logged out.")
    except:
        messages.error(request, "An error occurred. Try again.")
        return redirect('/')
    return redirect('/')
    
def privacy_policy(request):
    return render(request, 'privacy_policy.html')
    
def terms_and_conditions(request):
    return render(request, 'terms_and_conditions.html')
    
def feedback(request):
    return render(request, 'feedback.html')
