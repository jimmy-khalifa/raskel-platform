from django.db import models

class BinType(models.Model):

    # Code of the bin type
    code = models.CharField(max_length=2, blank=False, null=True)

    # Name of the bin type
    name = models.CharField(max_length=50, blank=False,null=True)
