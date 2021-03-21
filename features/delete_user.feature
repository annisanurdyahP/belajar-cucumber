Feature: Delete New User

  Scenario: Delete New User With Status Inactive
    Given User valid token to create new user
    And The user fill field name "Testing Delete"
    And The user fill field email with generate email "<email>"
    And The user fill field password "delete123"
    And The user fill field gender is "Male"
    And The user fill field status is "Inactive"
    And User send request in URL API "https://gorest.co.in/public-api/users"
    Then  User got "id" in response body to delete
    And User delete data with id and request "https://gorest.co.in/public-api/users/id"