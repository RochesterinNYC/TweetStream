Feature: Users

  Scenario: User signs in
    Given jeffrey@sixmapp.com exists
    When I sign in as jeffrey@sixmapp.com
    Then I should see "Signed in successfully."

  Scenario: User attempts to register an email that already exists
    Given jeffrey@sixmapp.com exists
    When I sign up as jeffrey@sixmapp.com
    Then I should see "Email has already been taken"

  Scenario: User attempts to register an email that already exists with different case
    Given jeffrey@sixmapp.com exists
    When I sign up as Jeffrey@sixmapp.com
    Then I should see "Email has already been taken"



