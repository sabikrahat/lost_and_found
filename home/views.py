from django.shortcuts import redirect, render
from home.models import PostModel, ResetPwdTokens, UserContact, UserFeedback, UserModel
from django.contrib.auth.hashers import make_password
from django.contrib.auth.hashers import check_password
from django.contrib import messages
from django.db import connection
import time
import uuid
from lost_and_found.mail_service import send_forget_password_mail

# Create your views here.


# authentication function


def temp(request):
    return render(request, 'temp.html')

# home function


def home(request):
    cursor = connection.cursor()
    cursor.execute(
        'SELECT * FROM user_posts ORDER BY id DESC;')
    posts = cursor.fetchall()
    cursor.close()
    return render(request, 'home.html', {'posts': posts})


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
            saveUser.completeProfile = '25%'
            saveUser.point = '100'

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
        if request.POST.get('editName') and request.POST.get('editPhn') and request.POST.get('editLocation') and request.POST.get('editBio') and request.POST.get('editMessengerUrl') and request.POST.get('editWhatsappUrl'):

            user.name = request.POST.get('editName')
            user.phoneNumber = request.POST.get('editPhn')
            user.location = request.POST.get('editLocation')
            user.bio = request.POST.get('editBio')
            user.messengerUrl = request.POST.get('editMessengerUrl')
            user.whatsappUrl = request.POST.get('editWhatsappUrl')
            if request.POST.get('editTelegramUrl'):
                user.telegramUrl = request.POST.get('editTelegramUrl')
            user.completeProfile = '100%'

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
                saveContact = UserContact()

                saveContact.messengerId = user.id
                saveContact.messengerName = user.name
                saveContact.messengerEmail = user.email
                saveContact.message = request.POST.get('txtMsg')

                saveContact.save()
                time.sleep(3)
                return redirect('/')
        else:
            return render(request, 'contact.html', {'user': user})
    except:
        messages.error(request, 'You need to login first')
        return redirect('authenticate')

# feedback functon


def feedback(request):
    try:
        user = UserModel.objects.get(email=request.session['email'])
        if request.method == 'POST':
            if request.POST.get('feedbackMsg'):
                saveFeedback = UserFeedback()

                saveFeedback.messengerId = user.id
                saveFeedback.messengerName = user.name
                saveFeedback.messengerEmail = user.email
                saveFeedback.message = request.POST.get('feedbackMsg')

                saveFeedback.save()
                return redirect('/')
        else:
            return render(request, 'feedback.html', {'user': user})
    except:
        messages.error(request, 'You need to login first')
        return redirect('authenticate')

# reset password functon


def forget_password(request):
    try:
        if request.method == 'POST' and request.POST.get('resetEmail'):
            email = request.POST.get('resetEmail')

        if not UserModel.objects.filter(email=email).first():
            messages.error(request, 'No user found with this email.')
            return render(request, 'reset_password/forget-password.html')

        user_obj = UserModel.objects.get(email=email)
        token = str(uuid.uuid4())
        resetPwdToken_obj = ResetPwdTokens.objects.get(user=user_obj.id)
        resetPwdToken_obj.forget_password_token = token
        resetPwdToken_obj.save()
        send_forget_password_mail(user_obj.email, token)
        messages.success(request, 'An email has been sent to ' + user_obj.email +
                         '. If you don\'t find any email in your mailbox, please check spam folder.')
        return render(request, 'reset_password/forget-password.html')

    except Exception as e:
        print(e)
    return render(request, 'reset_password/forget-password.html')

# change password functon


def change_password(request, token):
    context = {}

    try:
        resetPwdToken_obj = ResetPwdTokens.objects.filter(
            forget_password_token=token).first()
        context = {'user_id': resetPwdToken_obj.user.id}

        if request.method == 'POST':
            new_password = request.POST.get('new_password')
            confirm_password = request.POST.get('reconfirm_password')
            user_id = request.POST.get('user_id')

            if user_id is None:
                messages.error(request, 'No user id found.')
                return render(request, f'reset_password/change-password/{token}/.html', context)

            if new_password != confirm_password:
                messages.error(request, 'both should be equal.')
                return render(request, f'reset_password/change-password/{token}/.html', context)

            user_obj = UserModel.objects.filter(id=user_id).first()
            user_obj.password = make_password(new_password)
            user_obj.save()
            messages.success(request, 'Password updated.')
            return render(request, 'reset_password/change-password.html', context)
        else:
            return render(request, 'reset_password/change-password.html', context)

    except Exception as e:
        print(e)
        messages.error(request, 'url has already been used.')
        return render(request, 'reset_password/change-password.html', context)

# location api function


def location(request):
    return render(request, 'location.html')

# write post function


def write_post(request):
    # return render(request, 'write_post.html')
    try:
        user = UserModel.objects.get(email=request.session['email'])
        if user.completeProfile == '100%':
            if request.method == 'POST':
                if request.POST.get('title') and request.POST.get('location') and request.POST.get('description') and request.POST.get('datetime'):

                    savePost = PostModel()

                    savePost.publisherId = user.id
                    savePost.publisherName = user.name
                    savePost.title = request.POST.get('title')
                    savePost.description = request.POST.get('description')
                    savePost.location = request.POST.get('location')
                    savePost.lostDateTime = request.POST.get('datetime')

                    if len(request.FILES) != 0:
                        savePost.fileImg = request.FILES['fileImg']
                        savePost.fileSecretImg = request.FILES['fileSecretImg']

                    user.point = str(int(user.point) + 50)

                    user.save()
                    savePost.save()

                    messages.success(request, "Your post has been submitted!")
                    return redirect('/')
            else:
                return render(request, 'write_post.html', {'user': user})
        else:
            messages.error(request, "Complete your profile first!")
            return render(request, 'view_profile.html', {'user': user})
    except:
        messages.error(request, 'You need to login first')
        return redirect('authenticate')
