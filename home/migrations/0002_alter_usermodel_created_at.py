# Generated by Django 3.2.9 on 2021-11-21 11:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usermodel',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]