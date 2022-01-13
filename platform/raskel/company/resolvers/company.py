from ariadne import QueryType, MutationType

from ..models import Company
from geo.models import Municipality

company_query = QueryType()

@company_query.field('all_companies')
def resolve_all_companies(*_):
    return Company.objects.all()

@company_query.field('company_by_id')
def resolve_company_by_id(_, info, companyId):
    company = Company.objects.get(pk=companyId)
    return company

@company_query.field('companies_by_municipality')
def resolve_companies_by_municipality(_, info, municipalityId):
    if municipalityId== '' :
        companies = Company.objects.all()
        return list(companies)
    
    municipality = Municipality.objects.get(pk=municipalityId)
    company_queryset = Company.objects.filter(municipality=municipality)

    return list(company_queryset)

company_mutation = MutationType()

@company_mutation.field('create_company')
def resolve_create_company(_, info, input):
    municipality = None
    is_municipality = False
    
    company = Company.objects.create(legal_name=input['legal_name'], registration=input['registration'], code_tva=input['code_tva'])
    if('creation_date' in input) : company.creation_date = input['creation_date']
    if('phone_number_one' in input) : company.phone_number_one = input['phone_number_one']
    if('phone_number_two' in input) : company.phone_number_two = input['phone_number_two']
    if('fax' in input) : company.fax = input['fax']
    if('email' in input) : company.email = input['email']
    if('website' in input) : company.website = input['website']
    if('contact' in input) : company.contact = input['contact']
    if('municipalityId' in input) : 
        municipality = Municipality.objects.get(pk=input['municipalityId'])
        is_municipality = True
        company.municipality = municipality
        company.is_municipality = is_municipality
    
    company.save()
    
    return {'created': True, 'company': company, 'err': ''}

@company_mutation.field('modify_company')
def resolve_modify_company(_, info, input):
    company = Company.objects.get(pk=input['id'])
    if('creation_date' in input) : company.creation_date = input['creation_date']
    if('phone_number_one' in input) : company.phone_number_one = input['phone_number_one']
    if('phone_number_two' in input) : company.phone_number_two = input['phone_number_two']
    if('fax' in input) : company.fax = input['fax']
    if('email' in input) : company.email = input['email']
    if('website' in input) : company.website = input['website']
    if('contact' in input) : company.contact = input['contact']

    company.save()

    return {'modified':  True, 'company': company, 'err': ''}

