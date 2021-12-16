# Generated by Django 3.2.8 on 2021-12-15 08:47

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('geo', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Producer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('identifier', models.CharField(blank=True, max_length=256, null=True, unique=True, verbose_name='Unique Identifier')),
                ('first_name', models.CharField(max_length=256, verbose_name='First Name')),
                ('last_name', models.CharField(max_length=256, verbose_name='Last Name')),
                ('date_of_birth', models.DateField(blank=True, null=True, verbose_name='Date Of Birth')),
                ('age', models.IntegerField(blank=True, null=True, verbose_name='Age')),
                ('phone_number', models.CharField(max_length=100, unique=True, verbose_name='Phone Number')),
                ('email', models.EmailField(max_length=256, verbose_name='Email')),
                ('cin', models.CharField(blank=True, max_length=32, null=True, unique=True, verbose_name='Identity Number')),
                ('cin_delivery', models.DateField(blank=True, null=True, verbose_name='Identity Delivery Date')),
                ('is_principal', models.BooleanField(default=True, verbose_name='Is Principal')),
                ('address', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='geo.address', verbose_name='Address')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.PROTECT, to=settings.AUTH_USER_MODEL, verbose_name='User')),
            ],
        ),
        migrations.CreateModel(
            name='PropertyType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=4, verbose_name='Code')),
                ('name', models.CharField(max_length=500, verbose_name='Nom')),
            ],
        ),
        migrations.CreateModel(
            name='Property',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('area', models.FloatField(default=0.0, null=True, verbose_name='Area')),
                ('has_garden', models.BooleanField(default=False, verbose_name='Garden')),
                ('has_garage', models.BooleanField(default=False, verbose_name='Garage')),
                ('has_barn', models.BooleanField(default=False, verbose_name='Barn')),
                ('individuals', models.IntegerField(default=0, verbose_name='Individuals')),
                ('address', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='geo.address')),
                ('producer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='producer.producer', verbose_name='Producer')),
                ('type', models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.PROTECT, to='producer.propertytype')),
            ],
        ),
    ]