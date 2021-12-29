from django.core.mail import send_mail
from django.conf import settings


def send_forget_password_mail(email, token):
    try:
        subject = 'Your forget password link'
        message = f'Hi , click on the link to reset your password http://127.0.0.1:8000/change-password/{token}/'
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [email]
        send_mail(subject, message, email_from, recipient_list)
        # print('mail sent')
        return True
    except Exception as e:
        print(e)
        return False


def send_point_purchase_mail(name):
    try:
        subject = 'Point Purchase Request'
        message = f'{name} requested for purchase some points. Click the link given below to view.\n\n http://127.0.0.1:8000/admin-login'
        email_from = settings.EMAIL_HOST_USER
        recipient_list = ['lostandfound72428@gmail.com']
        send_mail(subject, message, email_from, recipient_list)
        return True
    except Exception as e:
        print(e)
        return False
