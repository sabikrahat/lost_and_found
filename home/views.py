from django.shortcuts import redirect, render
from home.models import ResetPwdTokens, UserFeedback, UserModel
from django.contrib.auth.hashers import make_password
from django.contrib.auth.hashers import check_password
from django.contrib import messages
import time

# Create your views here.


# home function


def home(request):
    return render(request, 'home.html')


# authentication function


def authenticate(request):
    return render(request, 'authenticate.html')


# signup function


def signup(request):
    if request.method == 'POST':
        if request.POST.get('name') and request.POST.get('email') and request.POST.get('password'):
            saveUser = UserModel()
            saveToken = ResetPwdTokens()

            saveUser.name = request.POST.get('name')
            saveUser.email = request.POST.get('email')
            saveUser.password = make_password(request.POST.get('password'))

            if saveUser.isExists():
                messages.error(
                    request, request.POST.get('email') + " email address already registered...! Please Log in.")
                # return render(request, 'authenticate.html', context)
                return redirect('../authenticate')
            else:
                saveUser.save()
                saveToken.user = saveUser
                saveToken.save()
                messages.success(
                    request, "Hello " + request.POST.get('name') + ", registration details saved successfully...! Please Log in now.")
                return redirect('../authenticate')
    else:
        return redirect('../authenticate')


# login function


def login(request):
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


# logout function


def logout(request):
    try:
        del request.session['email']
        messages.success(request, "Successfully logged out.")
    except:
        messages.error(request, "An error occurred. Try again.")
        return redirect('/')
    return redirect('/')


# privacy policy function


def privacy_policy(request):
    return render(request, 'privacy_policy.html')


# terms & conditions function

def terms_and_conditions(request):
    return render(request, 'terms_and_conditions.html')

# view profile page


def view_profile(request):
    try:
        user = UserModel.objects.get(email=request.session['email'])
        return render(request, 'view_profile.html', {'user': user})
    except:
        messages.error(request, 'You need to login first')
        return redirect('authenticate')

# edit profile page


def edit_profile(request):
    if request.method == 'POST':
        user = UserModel.objects.get(email=request.session['email'])
        if request.POST.get('editName') and request.POST.get('editPhn') and request.POST.get('editLocation') and request.POST.get('editBio') and request.POST.get('editMessengerUrl') and request.POST.get('editWhatsappUrl') and request.POST.get('editTelegramUrl'):

            user.name = request.POST.get('editName')
            user.phoneNumber = request.POST.get('editPhn')
            user.location = request.POST.get('editLocation')
            user.bio = request.POST.get('editBio')
            user.messengerUrl = request.POST.get('editMessengerUrl')
            user.whatsappUrl = request.POST.get('editWhatsappUrl')
            user.telegramUrl = request.POST.get('editTelegramUrl')

            if len(request.FILES) != 0:
                user.profileImg = request.FILES['editPhoto']
                user.nidFrontImg = request.FILES['editNidFront']
                user.nidBackImg = request.FILES['editNidBack']

            user.save()
            messages.success(
                request, "Your profile updated successfully...!")
            return redirect('view-profile')

    else:
        try:
            user = UserModel.objects.get(email=request.session['email'])
            return render(request, 'edit_profile.html', {'user': user})
        except:
            messages.error(request, 'You need to login first')
            return redirect('authenticate')

# contact function


def contact(request):
    try:
        user = UserModel.objects.get(email=request.session['email'])

        if request.method == 'POST':
            if request.POST.get('txtname') and request.POST.get('txtEmail') and request.POST.get('txtMsg'):
                saveFeedback = UserFeedback()

                saveFeedback.messengerId = user.id
                saveFeedback.messengerName = user.name
                saveFeedback.messengerEmail = user.email
                saveFeedback.message = request.POST.get('txtMsg')

                saveFeedback.save()
                time.sleep(3)
                return redirect('/')
        else:
            return render(request, 'contact.html', {'user': user})
    except:
        messages.error(request, 'You need to login first')
        return redirect('authenticate')

# feedback functon


def feedback(request):
    return render(request, 'feedback.html')
        
