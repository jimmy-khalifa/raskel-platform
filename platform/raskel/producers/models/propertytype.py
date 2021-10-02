from django.db import models

class PropertyType(models.Model):
    #PropertyType code field
    code = models.CharField(verbose_name="Code", max_length=4, blank=False)
    #PropertyType name field

    name = models.CharField(verbose_name="Nom", max_length=500, blank=False)

    def __str__(self):
        return str(self.name)