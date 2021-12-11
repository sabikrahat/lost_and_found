from django.contrib import admin
from home.models import ResetPwdTokens, UserContact, UserFeedback, UserModel

# Register your models here.
admin.site.register(UserModel)
admin.site.register(ResetPwdTokens)
admin.site.register(UserContact)
admin.site.register(UserFeedback)
