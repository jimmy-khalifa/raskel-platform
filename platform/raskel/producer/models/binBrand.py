from django.db import models
from geo.models import Address


class BinBrand(models.Model):
     # Code of the bin brand
    code = models.CharField(max_length=2, blank=False)

    # Name of the bin brand
    name = models.CharField(max_length=50, blank=False)

    #name of the company of the brand
    company=models.CharField(max_length=50, blank=False)

    #address of the brand’s company
    address=models.ForeignKey(Address, on_delete=models.PROTECT, blank=True)

    #first phone number of the brand’s company
    phone_one = models.CharField(max_length=100)

    #second phone number of the brand’s company
    phone_two = models.CharField(max_length=100)

    #email of the brand’s company
    email= models.EmailField(max_length=254)

    #website of the brand’s company
    website=models.CharField(max_length=100)