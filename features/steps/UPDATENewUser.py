from behave import given, step, then
import requests
import random
from faker import Faker

faker = Faker()


@given('token valid to user')
def user_token_acess(context):
  context.header = {"Authorization":"<ACCESS_USER_TOKEN>"}

@step('The user should fill field name is "Annisa"')
def create_name(context):
  context.request_body = {"name": "Annisa"}

@step('The user should fill field email is "<email>"')
def create_email(context):
  context.request_body = {"email": faker.email()}

@step('The user should fill field password is "haloannisa"')
def create_password(context):
  context.request_body = {"password": "haloannisa"}

@step('The user should fill field gender is "Female"')
def create_gender(context):
  context.request_body = {"gender": "Female"}

@step('The user should fill field status is "active"')
def create_status(context):
  context.request_body = {"status": "active"}

@step('User hit request in "https://gorest.co.in/public-api/users"')
def send_request_create_user(context):
  response = requests.post('https://gorest.co.in/public-api/users', headers=context.header, json=context.request_body)
  context.response_body = response.json()
  context.status_code = response.status_code

@then('User got "id" in response body')
def get_id_response(context):
   assert context.response_body['result']['id'] == ['id']

@step('The user update field name is "Annisa Nurdyah"')
def create_status(context):
  context.request_body = {"name": "Annisa Nurdyah"}

@step('The user not update field email is "<email>"')
def create_status(context):
  context.request_body = {"email": faker.email()}

@step('The user update field password is "annisanurdyah123"')
def create_status(context):
  context.request_body = {"password": "annisanurdyah123"}

@step('The user not update field gender is "female"')
def create_status(context):
  context.request_body = {"gender": "Female"}

@step('The user not update field status is "active"')
def create_status(context):
  context.request_body = {"status": "Active"}

@when('User send request in "https://gorest.co.in/public-api/users/<id>"')
def send_request_update_data_user(context):
  response = requests.update('https://gorest.co.in/public-api/users/id, headers=context.header, json=context.request_body)
  context.response_body = response.json()
  context.status_code = response.status_code