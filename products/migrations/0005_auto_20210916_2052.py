# Generated by Django 3.2 on 2021-09-16 20:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0004_auto_20210526_0120'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productrates',
            name='Cover',
            field=models.DecimalField(decimal_places=2, max_digits=8, null=True),
        ),
        migrations.AlterField(
            model_name='productrates',
            name='Rate',
            field=models.DecimalField(decimal_places=2, max_digits=8, null=True),
        ),
    ]
