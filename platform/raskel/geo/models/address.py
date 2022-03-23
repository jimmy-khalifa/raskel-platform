from django.contrib.gis.db import models
from .municipality import Municipality
from .district import District

"""
Model Address manages all the addresses
The address migh be spatial when the latitude & longitude are set
"""
class Address(models.Model):

    
    # Free text for the user to add his address details
    label = models.CharField(verbose_name="Lines", max_length=256, blank=True, null=True)

    # The zip code for the address
    zipcode = models.CharField(verbose_name="Zip Code", max_length=6, blank=True, null=True)

    # The municipality of this address
    municipality = models.ForeignKey(Municipality, verbose_name="Municipality", on_delete=models.PROTECT, blank=False, null=False)

    # The district if exists
    district = models.ForeignKey(District, verbose_name="District", on_delete=models.PROTECT, blank=True, null=True)

    # is the address spatial
    is_spatial= models.BooleanField(verbose_name="Spatial", default=False, blank=False, null=False)

    # The address point
    latlong = models.PointField(verbose_name="Localisation",default=None, blank=True, null=True)

    def __str__(self) -> str:
        return self.label