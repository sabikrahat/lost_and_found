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


def send_point_success_mail(email):
    try:
        subject = 'Point Added'
        message = f'Your requested point has been added to your account. Click the link given below to view.\n\n http://127.0.0.1:8000'
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [email]
        send_mail(subject, message, email_from, recipient_list)
        return True

    except Exception as e:
        print(e)
        return False


def send_claim_rejection_mail(email):
    try:
        subject = 'Lost and Found - Claim Rejected'
        message = f'Your request for claiming the material has been rejected by the admin. Click the link given below to view.\n\n http://127.0.0.1:8000'
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [email]
        send_mail(subject, message, email_from, recipient_list)
        return True

    except Exception as e:
        print(e)
        return False


def send_claim_acception_mail(user, email):
    try:
        subject = 'Lost and Found - Claim Acception'
        message = f'''Your request for claiming the material has been accepted by the admin.

        The post publisher details:
                        Name: {user.name}
                        Email: {user.email}
                        Phone: {user.phoneNumber}
                        Location: {user.location}
                        Bio: {user.bio}
                        Messenger: {user.messengerUrl}
                        Whatsapp: {user.whatsappUrl}
                        Telegram: {user.telegramUrl}

        Please Contact with the publisher for further details. Thank you for using our service. Please give us feedback on our service.

        Click the link given below to view. http://127.0.0.1:8000'''

        email_from = settings.EMAIL_HOST_USER
        recipient_list = [email]
        send_mail(subject, message, email_from, recipient_list)
        return True

    except Exception as e:
        print(e)
        return False
