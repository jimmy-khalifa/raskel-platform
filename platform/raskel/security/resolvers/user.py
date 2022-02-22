from ariadne import QueryType, MutationType
from django.contrib.auth import authenticate, login

from ..models import CustomUser as User
from ariadne_jwt.decorators import login_required
from producer.models import Producer
from geo.models import Address, Municipality
import string
import random

user_query = QueryType()

@user_query.field('me')
@login_required
def resolve_viewer(self, info, **kwargs):
    return info.context.get('request').user

user_mutation = MutationType()

"""
Mutation create_user to create a CustomUser
based on his phone number
"""
@user_mutation.field('create_user')
def resolve_create_user(_,info, input):
    # we define the return variables
    err = None
    user = None
    created = False

    # we create the username and the email from the user's first and last name
    username = '@' + (input['first_name'][0]).lower() + (input['last_name']).lower()
    email = str(input['first_name']).lower() + '.' + str(input['last_name']).lower() + '@iraskel.com'

    # we check that the phone number isn't already used
    exist = User.objects.filter(phone_number=input['phone_number'])
    # if it does not
    if exist.__len__() == 0:
        # we check that the username is not already used
        exist = User.objects.filter(username=username)
        
        # if it does
        if exist.__len__() != 0:
            # we change the username by adding a second letter
            username = '@' + (input['first_name'][0]).lower() + (input['first_name'][1]).lower() + (input['last_name']).lower()
            # we remove the dot (.) from the email
            email = str(input['first_name']).lower() + '' + str(input['last_name']).lower() + '@iraskel.com'
        
        pwd = generate_code()
        print('The Code Is : ' + pwd)
        # we create the user with the provided information
        user = User.objects.create_user(username=username, email=email, password=pwd, first_name=input['first_name'], last_name=input['last_name'], phone_number=input['phone_number'], is_active=True) 
        # we save the user
        user.save() 
        # we change the created return value to true
        created = True
        create_related_producer_info(user, input['municipality_id'])
    # if the phone number already taken we raise an error
    else :
        err = {"code": "U0001", "message": "This Phone Number Is Already Used!"}
    
    return {'created': created, 'user': user, 'err': err}

"""
Mutation verify_phone_number to verify the code
send by SMS to the user
"""
@user_mutation.field('verify_phone_number')
def resolve_verify_phone_number(_,info, input):
    # declare the return values
    success = False
    err = ''

    # get the user by phone number
    #user = User.objects.get(phone_number=input['phone_number'])
    # authenticate the user with the username and code as password
    authenticated = authenticate(phone_number=input['phone_number'], password=input['code'])
    
    # if the user is authenticated
    if authenticated is not None:
        # we login the user to the contex
        login(info.context['request'], authenticated, '')
        success = True
        # we change the user to active
        authenticated.is_confirmed = True
        #authenticated.is_authenticated = True
        authenticated.save()
        
    else:
        err = "Not Successful"

    return {'user':authenticated,'success': success, 'err': err}

@user_mutation.field('user_phone')
def resolve_user_phone(_,info,input):
    user = None
    err = {}
    try:
        user = User.objects.get(phone_number = input['phone_number'])
        if user != None :
            pwd = generate_code()
            print('The Code Is : ' + pwd)
            user.set_password(pwd)
            
            user.save()
    except:
        err = {'code' : 'ERR001', 'message': 'Phone number ' + input['phone_number'] + ' is not registred'}       

    return {'user': user, 'err': err}

"""
Mutation resend_verification_code to resend a new verification 
SMS with a new code
"""
@user_mutation.field('resend_verification_code')
def resolve_resend_verification_code(_, info, input):
    return 'hello'

"""
As soon as the user is created we create a new producer with its related
Address / Property / Bins
"""
def create_related_producer_info(user, municipality_id):
    # we get the municipality with the selected municipality_id
    municipality = Municipality.objects.get(id=municipality_id)
    # we create a new address
    new_address = Address.objects.create(label="", zipcode="", municipality=municipality, is_spatial=True)
    new_address.save()

    # we create the producer with a relation to the user and the address
    new_producer = Producer.objects.create(first_name=user.first_name, last_name=user.last_name, phone_number=user.phone_number, email=user.email,
    user=user, address=new_address)
    new_producer.save()
    

def generate_code():
    # we create a string of uppercases ascii letters and digits
    alphanum = string.ascii_uppercase + string.digits
    # we get a random list of 8 Upper characters digits
    chars = random.choices(alphanum, weights=None, k=8)
    # we change the list to a string and generate the code
    return "".join(chars)