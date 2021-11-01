from django.db import models
#from .address import Address
#from .property import Property


class Producer(models.Model):

    #the producer first name as it is presented in legal documents
    first_name=models.CharField(max_length=100)

    #producer's last name as presented in legal documents
    last_name=models.CharField(max_length=100)

    #producer date of birth
    date_of_birth = models.DateField()

    #producer’s age
    age=models.IntegerField()

    #producer’s personal phone number
    phone_number = models.CharField(max_length=100)

    #producer’s email address
    email= models.EmailField(max_length=254)

    #identity card number
    cin = models.CharField(max_length=10)

    #identity card’s delivery date
    cin_delivery=models.DateField()

    #indicates that the user is the principal or not
    is_principal=models.BooleanField( default=True)

    #address presenting the producer’s address
    #address=models.ForeignKey(Address, on_delete=models.PROTECT, blank=True)

    #producer’s property (House, Coffee Shop, Restaurant…)
    #property=models.ForeignKey(Property,on_delete=models.PROTECT, blank=True)

    objects = models.Manager()

    def __str__(self):
       return self.first_name + " " + self.last_name