from django.contrib import admin
from home.models import ResetPwdTokens, UserContact, UserModel

# Register your models here.
admin.site.register(UserModel)
admin.site.register(ResetPwdTokens)
admin.site.register(UserContact)
