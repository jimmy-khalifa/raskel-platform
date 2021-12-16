from django.contrib.gis.db import models

from .municipality import Municipality

"""
Model District responsible for all the districts
"""
class District(models.Model):
    
    code = models.CharField(verbose_name="District Code", max_length=256, blank=False, null=False)
    name = models.CharField(verbose_name="District Name", max_length=256, blank=False, null=False)
    municipality =  models.ForeignKey(Municipality, on_delete=models.PROTECT)
    shape = models.MultiPolygonField(verbose_name="Shape", null=True)