# Generated by Django 4.0 on 2022-01-03 21:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('policy', '0012_alter_policy_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='policymembers',
            name='MemberType',
            field=models.CharField(choices=[('Main Member', 'Main Member'), ('Spouse', 'Spouse'), ('Child', 'Child'), ('Adult Dependent', 'Adult Dependent')], max_length=20),
        ),
        migrations.AlterField(
            model_name='policyversion',
            name='EndorsementType',
            field=models.CharField(choices=[('Inception', 'Inception'), ('Internal', 'Internal'), ('Endorsement', 'Endorsement'), ('Cancellation', 'Cancellation')], max_length=20),
        ),
    ]
