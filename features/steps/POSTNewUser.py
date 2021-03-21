from behave import given, step, then
import requests
import random
from faker import Faker

faker = Faker()

@given('User a Valid Token')
def user_token_acess(context):
  context.header = {"Authorization":"<ACCESS_USER_TOKEN>"}

@step('The user fill field name "Annisa"')
def create_name(context):
  context.request_body = {"name": "Annisa"}

@step('The user fill field email "<email>"')
def create_email(context):
  context.request_body = {"email": faker.email()}

@step('The user fill field password "haloannisa"')
def create_password(context):
  context.request_body = {"password": "haloannisa"}

@step('The user fill field gender is "female"')
def create_gender(context):
  context.request_body = {"gender": "Female"}

@step('The user fill field status is "active"')
def create_status(context):
  context.request_body = {"status": "active"}

@step('User send request in "https://gorest.co.in/public-api/users"')
def send_request_create_user(context):
  response = requests.post('https://gorest.co.in/public-api/users')
  context.response_body = response.json()
  context.status_code = response.status_code