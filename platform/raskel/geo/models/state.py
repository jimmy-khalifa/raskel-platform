from django.contrib.gis.db import models
from .country import Country

"""
Model State manages all the states in the database
This class is managed manually by postgis and have a geometry field
"""
class State(models.Model):
    # Telling django to skip the creation of this table while migrating
    class Meta:
        managed=False
    
    # state's code
    code = models.CharField(verbose_name="State Code", max_length=256, blank=False, null=False)
    
    # state's name
    name = models.CharField(verbose_name="State Name", max_length=256, blank=False, null=False)

    # state's country
    country = models.ForeignKey(Country, on_delete=models.PROTECT)

    # state's arabic name
    name_ar = models.CharField(verbose_name="State Arabic Name", max_length=256, blank=False, null=False)

    # geometry field
    shape = models.MultiPolygonField(verbose_name="Shape")