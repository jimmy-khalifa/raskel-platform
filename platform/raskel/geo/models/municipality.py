from django.contrib.gis.db import models
from .state import State

"""
This model is managed manually with postgis, it's not created through migrations
This model has all the list of municipalities with their geometry
"""
class Municipality(models.Model):
    # Telling django to skip the creation of this table while migrating
    class Meta:
        managed=False
    
    # The name of the municipality
    name = models.CharField(verbose_name="Municipality Name", max_length=256, blank=False, null=False)
    
    # The arabic name of the municipality
    name_ar = models.CharField(verbose_name="Municipality Name", max_length=256, blank=False, null=False)
    
    # The unique code for municipality
    code = models.CharField(verbose_name="Municipality Code", max_length=32, unique=True, null=False, blank=False)

    # The parent state of the municipality
    state =  models.ForeignKey(State, on_delete=models.PROTECT)

    # The shape of the municipality
    shape = models.MultiPolygonField(verbose_name="Shape")

    def __str__(self):
        return self.code + ' - ' + self.name