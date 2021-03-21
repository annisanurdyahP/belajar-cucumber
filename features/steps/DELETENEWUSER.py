from behave import given, step, then
import requests
import random
from faker import Faker

faker = Faker()

@given('User valid token to create new user')
def user_token_acess(context):
  context.header = {"Authorization":"<ACCESS_USER_TOKEN>"}

@step('The user fill field name "Testing Delete"')
def create_name(context):
  context.request_body = {"name": "Testing Delete"}

@step('The user fill field email with generate email "<email>"')
def create_email(context):
  context.request_body = {"email": faker.email()}

@step('The user fill field password "delete123"')
def create_password(context):
  context.request_body = {"password": "delete123"}

@step('The user fill field gender is "Male"')
def create_gender(context):
  context.request_body = {"gender": "Male"}

@step('The user fill field status is "Inactive"')
def create_status(context):
  context.request_body = {"status": "Inactive"}

@step('User send request in URL API "https://gorest.co.in/public-api/users"')
def send_request_create_user(context):
  response = requests.post('https://gorest.co.in/public-api/users')
  context.response_body = response.json()
  context.status_code = response.status_code

@then('User got "id" in response body to delete')
def get_id_response(context):
   assert context.response_body['result']['id'] == ['id']

@step('User delete data with id and request "https://gorest.co.in/public-api/users/id')
def send_request_delete_user(context):
  response = requests.delete('https://gorest.co.in/public-api/users/id')
  context.response_body = response.json()
  context.status_code = response.status_code
