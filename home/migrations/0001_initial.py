# Generated by Django 3.2.9 on 2022-01-02 18:11

import datetime
from django.db import migrations, models
import django.db.models.deletion
import home.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BkashPayment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('email', models.CharField(max_length=50)),
                ('bkashNumber', models.CharField(max_length=20)),
                ('bkashTransaction', models.CharField(max_length=512)),
                ('point', models.CharField(max_length=10)),
                ('status', models.CharField(max_length=20)),
                ('created_at', models.DateTimeField(default=datetime.datetime.now)),
            ],
            options={
                'db_table': 'bkash_payment',
            },
        ),
        migrations.CreateModel(
            name='ClaimOwner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('claimerId', models.CharField(max_length=20)),
                ('claimerName', models.CharField(max_length=50)),
                ('claimerEmail', models.CharField(max_length=40)),
                ('postId', models.CharField(max_length=20)),
                ('postPunlisherEmail', models.CharField(max_length=40)),
                ('postPunlisherName', models.CharField(max_length=50)),
                ('claimFileImg', models.ImageField(blank=True, null=True, upload_to=home.models.filepath)),
                ('status', models.CharField(max_length=20)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'claim_owner',
            },
        ),
        migrations.CreateModel(
            name='PostModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('publisherId', models.CharField(max_length=20)),
                ('publisherName', models.CharField(max_length=50)),
                ('title', models.CharField(max_length=100)),
                ('description', models.CharField(max_length=3072)),
                ('location', models.CharField(max_length=50)),
                ('lostDateTime', models.DateTimeField()),
                ('fileImg', models.ImageField(blank=True, null=True, upload_to=home.models.filepath)),
                ('fileSecretImg', models.ImageField(blank=True, null=True, upload_to=home.models.filepath)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'user_posts',
            },
        ),
        migrations.CreateModel(
            name='UserContact',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('messengerId', models.CharField(max_length=10)),
                ('messengerName', models.CharField(max_length=50)),
                ('messengerEmail', models.CharField(max_length=40)),
                ('message', models.CharField(max_length=3072)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'users_contacts',
            },
        ),
        migrations.CreateModel(
            name='UserFeedback',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('messengerId', models.CharField(max_length=10)),
                ('messengerName', models.CharField(max_length=50)),
                ('messengerEmail', models.CharField(max_length=40)),
                ('message', models.CharField(max_length=3072)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'users_feedbacks',
            },
        ),
        migrations.CreateModel(
            name='UserModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('email', models.CharField(max_length=40)),
                ('password', models.CharField(max_length=1024)),
                ('phoneNumber', models.CharField(max_length=15)),
                ('bio', models.CharField(max_length=1024)),
                ('point', models.CharField(max_length=5)),
                ('completeProfile', models.CharField(max_length=5)),
                ('location', models.CharField(max_length=50)),
                ('messengerUrl', models.CharField(max_length=100)),
                ('whatsappUrl', models.CharField(max_length=100)),
                ('telegramUrl', models.CharField(max_length=100)),
                ('profileImg', models.ImageField(blank=True, null=True, upload_to=home.models.filepath)),
                ('nidFrontImg', models.ImageField(blank=True, null=True, upload_to=home.models.filepath)),
                ('nidBackImg', models.ImageField(blank=True, null=True, upload_to=home.models.filepath)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'app_users',
            },
        ),
        migrations.CreateModel(
            name='ResetPwdTokens',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('forget_password_token', models.CharField(max_length=100)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='home.usermodel')),
            ],
            options={
                'db_table': 'reset_pwd_tokens',
            },
        ),
    ]
