from django.contrib.gis.db import models


""" 
Model Country manging the countries in the database
This class is managed manually by postgis and have a geometry field
"""
class Country(models.Model):
    # Telling django to skip the creation of this table while migrating
    class Meta:
        managed=False
    
    # The code of the country
    code = models.CharField(verbose_name="Country Code", max_length=256, blank=False, null=False)

    # The country's name
    name = models.CharField(verbose_name="Country Name", max_length=256, blank=False, null=False)

    # The country geometry field of type multipolygons
    shape = models.MultiPolygonField(verbose_name="Shape")