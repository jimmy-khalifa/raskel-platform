from django.db import models

from .binType import BinType
from .binBrand import BinBrand
from .producer import Producer
class Bin(models.Model):


    #type of the bin
    type=models.ForeignKey(BinType, on_delete=models.PROTECT,null=True,blank=False)

    #size of the bin
    size=models.CharField(max_length=50, default="50x20x10")

    producer = models.ForeignKey(Producer, on_delete=models.CASCADE, verbose_name="Producer",null=True, blank=False)


    #volume of the bin
    volume=models.FloatField(blank=False,null=True,default=0.0)

    #color of the bin
    color=models.CharField(max_length=100,null=True)

    #bar code of the bin
   # bar_code=models.CharField(max_length=100)

    #Brand of the bin
    brand=models.ForeignKey(BinBrand, on_delete=models.PROTECT,null=True)

    objects = models.Manager()

    