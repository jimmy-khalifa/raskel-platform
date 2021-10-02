from django.contrib import admin

from .models.address import Address
from .models.property import Property
from .models.propertytype import PropertyType

# Register your models here.


admin.site.register(Address)
admin.site.register(PropertyType)
admin.site.register(Property)
