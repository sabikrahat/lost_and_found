from django.db import models

# Create your models here.
from datetime import datetime
import os


def filepath(request, filename):
    old_filename = filename
    timeNow = datetime.now().strftime('%Y%m%d%H:%M:%S')
    filename = "%s-%s" % (timeNow, old_filename)
    return os.path.join('uploads/', filename)


class UserModel(models.Model):
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=40)
    password = models.CharField(max_length=1024)
    phoneNumber = models.CharField(max_length=15)
    bio = models.CharField(max_length=1024)
    point = models.CharField(max_length=5)
    completeProfile = models.CharField(max_length=5)
    location = models.CharField(max_length=50)
    messengerUrl = models.CharField(max_length=100)
    whatsappUrl = models.CharField(max_length=100)
    telegramUrl = models.CharField(max_length=100)
    profileImg = models.ImageField(upload_to=filepath, null=True, blank=True)
    nidFrontImg = models.ImageField(upload_to=filepath, null=True, blank=True)
    nidBackImg = models.ImageField(upload_to=filepath, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'app_users'

    def isExists(self):
        if UserModel.objects.filter(email=self.email):
            return True
        return False


class ResetPwdTokens(models.Model):
    user = models.OneToOneField(UserModel, on_delete=models.CASCADE)
    forget_password_token = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'reset_pwd_tokens'

    def __str__(self):
        return self.user.email


class UserContact(models.Model):
    messengerId = models.CharField(max_length=10)
    messengerName = models.CharField(max_length=50)
    messengerEmail = models.CharField(max_length=40)
    message = models.CharField(max_length=3072)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'users_contacts'


class UserFeedback(models.Model):
    messengerId = models.CharField(max_length=10)
    messengerName = models.CharField(max_length=50)
    messengerEmail = models.CharField(max_length=40)
    message = models.CharField(max_length=3072)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'users_feedbacks'


class PostModel(models.Model):
    publisherId = models.CharField(max_length=20)
    publisherName = models.CharField(max_length=50)
    title = models.CharField(max_length=100) 
    description = models.CharField(max_length=3072)
    location = models.CharField(max_length=50)
    lostDateTime = models.DateTimeField()
    fileImg = models.ImageField(upload_to=filepath, null=True, blank=True)
    fileSecretImg = models.ImageField(
        upload_to=filepath, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'user_posts'


class ClaimOwner(models.Model):
    claimerId = models.CharField(max_length=20)
    claimerName = models.CharField(max_length=50)
    claimerEmail = models.CharField(max_length=40)
    postId = models.CharField(max_length=20)
    postPunlisherEmail = models.CharField(max_length=40)
    postPunlisherName = models.CharField(max_length=50)
    claimFileImg = models.ImageField(upload_to=filepath, null=True, blank=True)
    status = models.CharField(max_length=20)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'claim_owner'


class BkashPayment(models.Model):
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    bkashNumber = models.CharField(max_length=20)
    bkashTransaction = models.CharField(max_length=512)
    point = models.CharField(max_length=10)
    status = models.CharField(max_length=20)
    created_at = models.DateTimeField(default=datetime.now)

    class Meta:
        db_table = 'bkash_payment'
