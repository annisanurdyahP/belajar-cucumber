Feature: POST Create New User

  Scenario: Create New User With Valid Data
    Given User a Valid Token
    And The user fill field name "Annisa"
    And The user fill field email "<email>"
    And The user fill field password "haloannisa"
    And The user fill field gender is "female"
    And The user fill field status is "active"
    And User send request in "https://gorest.co.in/public-api/users"