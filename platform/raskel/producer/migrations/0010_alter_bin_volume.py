# Generated by Django 3.2.8 on 2022-03-16 13:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('producer', '0009_alter_bin_color'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bin',
            name='volume',
            field=models.FloatField(default=0.0),
        ),
    ]
