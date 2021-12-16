from django.db import models
from geo.models import Municipality

"""
Model Company managing companies
"""
class Company(models.Model):

    # Company's legal name as mention in official documents
    legal_name = models.CharField(verbose_name="Legal Name", max_length=256, blank=False, null=False)

    # Company's registration number 
    registration = models.CharField(verbose_name="Registre Number", max_length=256, blank=True, null=True)

    # Company's TVA Code
    code_tva = models.CharField(verbose_name="TVA Code", max_length=256, blank=True, null=True)

    # Company's creation date
    creation_date = models.DateField(verbose_name="Creation Date", default=None, blank=True, null=True)

    # Company's first Phone Number
    phone_number_one = models.CharField(verbose_name="Phone 1", default='', max_length=256, blank=True, null=True)

    # Company's second Phone Number
    phone_number_two = models.CharField(verbose_name="Phone 2", default='', max_length=256, blank=True, null=True)

    # Company's Fax number
    fax = models.CharField(verbose_name="Fax", default='', max_length=256, blank=True, null=True)

    # Company's email address
    email = models.CharField(verbose_name="Email", default='', max_length=256, blank=True, null=True)

    # Company's website url
    website = models.CharField(verbose_name="Website", default='', max_length=256, blank=True, null=True)

    # Company's contact person's full name
    contact = models.CharField(verbose_name="Contact Name", default='', max_length=256, blank=True, null=True)

    # Company's logo
    logo = models.ImageField(verbose_name="logo")

    # is this company a municipality
    is_municipality = models.BooleanField(verbose_name="Municipality", default=False)

    # is this company active
    is_active = models.BooleanField(verbose_name="Active", default=True)

    municipality = models.ForeignKey(Municipality, on_delete=models.PROTECT, default=None, null=True, blank=True)

    def __str__(self) -> str:
        return self.legal_name
