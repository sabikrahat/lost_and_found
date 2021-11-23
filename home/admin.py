from django.contrib import admin
from home.models import UserFeedback, UserModel

# Register your models here.
admin.site.register(UserModel)
admin.site.register(UserFeedback)
