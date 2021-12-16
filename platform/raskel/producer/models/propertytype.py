from django.db import models

"""
Each property has a type to define it
A property can be a residence / commercial / public / industrial
"""
class PropertyType(models.Model):
    
    #PropertyType code field
    code = models.CharField(verbose_name="Code", max_length=4, blank=False)
    
    #PropertyType name field
    name = models.CharField(verbose_name="Nom", max_length=500, blank=False)

    def __str__(self):
        return self.code + " - " + self.name