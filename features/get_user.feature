Feature: GET data after successfully created new user

  Scenario Outline: Get Data New User
    Given access user valid token
    And The user fill field name with "Annisa"
    And The user fill field email with "<email>"
    And The user fill field password with "haloannisa"
    And The user fill field gender with "Female"
    And The user fill field status with "active"
    And User hit request in "https://gorest.co.in/public-api/users"
    Then  User got "id" in response body
    And User send request in "https://gorest.co.in/public-api/users/<id>"
    And user get response status code 200
    And user get response name "Annisa"
    And user get response email "<email>"
    And user get response password "haloannisa"
    And user get response gender "female"
    And user get response status "active"
