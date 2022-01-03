from django.db import models

class Contract(models.Model):
    number = models.CharField(verbose_name="Contract Number", max_length=256, blank=False, null=False)
    start_date = models.DateField(verbose_name="Start Date", blank=False, null=False)
    end_date = models.DateField(verbose_name="Start Date", blank=False, null=False)
    date = models.DateField(verbose_name="Start Date", blank=False, null=False)
