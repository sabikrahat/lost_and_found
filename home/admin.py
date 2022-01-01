from django.contrib import admin
from home.models import BkashPayment, ClaimOwner, PostModel, ResetPwdTokens, UserContact, UserFeedback, UserModel

# Register your models here.
admin.site.register(UserModel)
admin.site.register(ResetPwdTokens)
admin.site.register(UserContact)
admin.site.register(UserFeedback)
admin.site.register(PostModel)
admin.site.register(ClaimOwner)
admin.site.register(BkashPayment)
