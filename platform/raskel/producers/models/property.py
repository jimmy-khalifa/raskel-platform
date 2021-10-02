from django.db import models
from .propertytype import PropertyType
from .address import Address

class Property(models.Model):
    #Property area field
    area= models.FloatField(verbose_name="Area", default=0.0, null=True)
    #property garden field
    has_garden= models.BooleanField(verbose_name="Jardin", default=False, null=False)
    #property garage field
    has_garage =models.BooleanField(verbose_name="Garage",default=False,null=False)
    #property residence field
    is_residence=models.BooleanField(verbose_name="Résident", default=True,null=False)
    is_commercial=models.BooleanField(verbose_name="Commerce",default=False,null=False)
    is_public=models.BooleanField(verbose_name="Publié",default=False,null=False)
    #individuals'number field
    individuals= models.IntegerField(verbose_name="Individus",default=0,null=False)


    #Place Foreign Keys for the Property
    address= models.ForeignKey(Address,on_delete=models.PROTECT,null=False)
    type= models.ForeignKey(PropertyType,on_delete=models.PROTECT,null=False)

    #Property model object
    objects=models.Manager()

    # model representation function __str__

    def __str__(self):
        return str(self.area +" " + self.individuals.__str__())
