from django.db import models
from .propertytype import PropertyType
from .producer import Producer
from geo.models import Address

"""
Each Producer has one or more properties
It might be a property that he lives in (residence) or a commercial property
that he is renting or working in
This model manages the producer's properties
"""
class Property(models.Model):
    
    #Property area field
    area = models.FloatField(verbose_name="Area", default=0.0, null=True)
    
    #property garden field
    has_garden = models.BooleanField(verbose_name="Garden", default=False, null=True)
    
    #property garage field
    has_garage = models.BooleanField(verbose_name="Garage", default=False, null=True)
    
    #property garage field
    has_barn = models.BooleanField(verbose_name="Barn", default=False, null=True)
    
    #individuals'number field
    individuals = models.IntegerField(verbose_name="Individuals", default=0, null=True)

    producer = models.ForeignKey(Producer, on_delete=models.CASCADE, verbose_name="Producer", null=False, blank=False)

    #Place Foreign Keys for the Property
    address = models.ForeignKey(Address, on_delete=models.PROTECT, null=True)
    
    type = models.ForeignKey(PropertyType, on_delete=models.PROTECT, default=None, null=True)

    #Property model object
    objects = models.Manager() 

    # model representation function __str__

    def __str__(self):
        return self.producer.__str__() + '(' + self.type.__str__() + ')'
