# Generated by Django 3.2.8 on 2022-03-16 13:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('producer', '0008_remove_binbrand_address'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bin',
            name='color',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
