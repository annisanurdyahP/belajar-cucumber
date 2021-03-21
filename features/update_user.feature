Feature: Update data after successfully created new user

  Scenario Outline: Update Data New User
    Given token valid to user
    And The user should fill field name is "Annisa"
    And The user should fill field email is "<email>"
    And The user should fill field password is "haloannisa"
    And The user should fill field gender is "Female"
    And The user should fill field status is "active"
    And User hit request in "https://gorest.co.in/public-api/users"
    Then  User got "id" in response body
    And The user update field name is "Annisa Nurdyah"
    And The user not update field email is "<email>"
    And The user update field password is "annisanurdyah123"
    And The user not update field gender is "female"
    And The user not update field status is "active"
    When User send request update in "https://gorest.co.in/public-api/users/<id>"
