from django.db import models
from six import add_move
from geo.models import Address


from security.models import CustomUser as User


class Producer(models.Model):

    # Producer Unique Identifier (XXXXYYYYYYYY) Municipality Code + CIN Number
    identifier = models.CharField(verbose_name="Unique Identifier", max_length=256, unique=True, blank=True, null=True)

    # the producer first name as it is presented in legal documents
    first_name = models.CharField("First Name", max_length=256, blank=False, null=False)

    # producer's last name as presented in legal documents
    last_name=models.CharField("Last Name", max_length=256, blank=False, null=False)

    # producer date of birth
    date_of_birth = models.DateField("Date Of Birth", blank=True, null=True)

    # producer’s age
    age = models.IntegerField("Age", blank=True, null=True)

    # producer’s personal phone number
    phone_number = models.CharField("Phone Number", unique=True, max_length=100, blank=False, null=False)

    # producer’s email address
    email= models.EmailField("Email", max_length=256, blank=False, null=False)

    # identity card number
    cin = models.CharField("Identity Number", unique=True, max_length=32, blank=True, null=True)

    #identity card’s delivery date
    cin_delivery=models.DateField("Identity Delivery Date", blank=True, null=True)

    #indicates that the user is the principal or not
    is_principal=models.BooleanField("Is Principal", default=True, blank=False, null=False)

    user = models.OneToOneField(User, on_delete=models.PROTECT, verbose_name="User", blank=False, null=False)

    address = models.ForeignKey(Address, on_delete=models.PROTECT, verbose_name="Address", blank=True, null=True)

    image= models.FileField("image", default= None, blank=True,null=True, max_length= 100000)

    cin_pic_front = models.FileField("cin_pic_front",default= None, blank=True,null=True)

    cin_pic_back = models.FileField("cin_pic_back", default= None, blank=True,null=True)

    objects = models.Manager()

    def __str__(self):
       return self.first_name + " " + self.last_name