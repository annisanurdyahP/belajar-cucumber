from behave import given, step, then
import requests
import random
from faker import Faker

faker = Faker()

@given('user valid token')
def user_token_acess(context):
  context.header = {"Authorization":"<ACCESS_USER_TOKEN>"}

@step('The user fill field name with "Annisa"')
def create_name(context):
  context.request_body = {"name": "Annisa"}

@step('The user fill field email with "<email>"')
def create_email(context, email_user):
  context.request_body = {"email": faker.email()}

@step('The user fill field password with "haloannisa"')
def create_password(context):
  context.request_body = {"password": "haloannisa"}

@step('The user fill field gender with "Female"')
def create_gender(context):
  context.request_body = {"gender": "Female"}

@step('The user fill field status with "active"')
def create_status(context):
  context.request_body = {"status": "active"}

@step('User hit request in "https://gorest.co.in/public-api/users"')
def send_request_create_user(context):
  response = requests.post('https://gorest.co.in/public-api/users', headers=context.header, json=context.request_body)
  context.response_body = response.json()
  context.status_code = response.status_code

@then('User sucessfully create new data got "id" in response body')
def get_id_response(context):
   assert context.response_body['result']['id'] == ['id']

@step('User send request in "https://gorest.co.in/public-api/users/<id>"')
def send_request_get_detail_user(context):
  response = requests.get('https://gorest.co.in/public-api/users/id', headers=context.header, json=context.request_body)
  context.response_body = response.json()
  context.status_code = response.status_code

@step('user get response status code 200')
def create_status(context):
  assert context.response_body['code'] == "200"

@step('user get response name "Annisa"')
def create_status(context):
  assert context.response_body['code'] == "Annisa"

@step('user get response email "<email>"')
def create_status(context):
  assert context.response_body['email'] == "<email>"

@step('user get response password "haloannisa"')
def create_status(context):
  assert context.response_body['password'] == "haloannisa"

@step('user get response gender "female"')
def create_status(context):
  assert context.response_body['password'] == "Female"

@step('user get response status "active"')
def create_status(context):
  assert context.response_body['password'] == "Active"


