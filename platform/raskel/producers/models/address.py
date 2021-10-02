from django.db import models

#Create model class for the Address
class Address(models.Model):
    #Address label field
    label=models.CharField(verbose_name="label", max_length=10)
    #Address street field
    street = models.CharField(verbose_name="Rue", max_length=100)
    #Address village field
    village = models.CharField(verbose_name="Village", max_length=100)
     #Address city field

    city= models.CharField(verbose_name="Ville", max_length=100)
    #Address state field

    state = models.CharField(verbose_name="Etat", max_length=100)
    #Address country field
    country= models.CharField(verbose_name="Pays", max_length=50)
    zipcode= models.CharField(verbose_name="Zip Code", max_length=10)
    is_spatial= models.BooleanField(verbose_name="Spatial",default=False)
    if (is_spatial == True):
    
        latitude = models.FloatField(verbose_name="Latitude",default=0.0)
        longitude = models.FloatField(verbose_name="Longitude",default=0.0)

    #Address model object

    objects = models.Manager()

    # model representation function __str__

    def __str__(self):
        return self.label +" " + self.zicode


    



