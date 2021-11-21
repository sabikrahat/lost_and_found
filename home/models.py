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
    location = models.CharField(max_length=30)
    point = models.CharField(max_length=5)
    image = models.ImageField(upload_to=filepath, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'app_users'

    def isExists(self):
        if UserModel.objects.filter(email=self.email):
            return True
        return False
