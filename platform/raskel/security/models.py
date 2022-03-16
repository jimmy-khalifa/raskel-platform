from django.db import models
from django.contrib.auth.models import AbstractUser

class CustomUser(AbstractUser):

    phone_number = models.CharField(unique=True, blank=False, max_length=200, verbose_name="Phone Number")

    is_active = models.BooleanField('active',
        default=False,
        help_text=(
            'Designates whether this user should be treated as active. '
            'A User is first active when he confirm his phone number'
            'Unselect this instead of deleting accounts.'
        ),
    )

    is_confirmed = models.BooleanField('confirmed',
        default=False,
        help_text=(
            'Designates whether this user should be treated as active. '
            'Unselect this instead of deleting accounts.'
        ),
    )

    is_verified = models.BooleanField('verified',
        default=False,
        help_text=(
            'Designates whether this user information has been verified. '
            'Unselect this instead of deleting accounts.'
        ),
    )
    
    USERNAME_FIELD = "phone_number"
    #REQUIRED_FIELDS = ['phone_number']