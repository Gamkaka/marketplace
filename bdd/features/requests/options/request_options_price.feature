@api @watchdog
Feature: Request Option Price
  In order to test Request with different prices in circles
  As a Client and an Expert
  I want to create a Request with the paying options with different prices depending on circles

  Background: Create request

    Given "circle" content:
    | title                   | author  |
    | Avengers                | admin   |
    | League Of Justice       | admin   |
    | Guardians Of The Galaxy | admin   |

    Given "corporate" content:
    | title                 | author  |
    | Marvel Studios        | admin   |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_other_areas  | og_user_node | field_mail                      | field_entreprise     | field_working_status | field_domaine |
    | client1 | emindhub.test+client1@gmail.com | business | Captain          | AMERICA         | 0612345678      | Chef de groupe     | Avengers, League Of Justice, Guardians Of The Galaxy     | emindhub.test+client1@gmail.com | Marvel Studios     | Freelancer | Maintenance |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_other_areas  | og_user_node | field_mail                      | field_entreprise     | field_working_status | field_domaine |
    | expert1 | emindhub.test+expert1@gmail.com | expert   | Iron             | MAN             | 0712345670      | Chieur génial      | Avengers, League Of Justice, Guardians Of The Galaxy     | emindhub.test+expert1@gmail.com | Marvel Studios     | Employee             | Energy        |

    Given I give "client1" 10000 emh credits

    Given I am logged in as a user with the "administrator" role

    When I go to "admin/emindhub/credits"
    Then I fill in "Duration" with "200"
      And I press "Save configuration"

    # Set price for options
    When I go to "content/avengers"
      And I click "Edit"
      And I fill in "Questionnaire" with "1000"
      And I fill in "Duration" with "1000"
      And I press "Save"

    When I go to "content/league-justice"
      And I click "Edit"
      And I fill in "Questionnaire" with "700"
      And I fill in "Duration" with "1300"
      And I press "Save"

    # Make client1 as a Creator member of circles
    When I go to "content/avengers"
      And I click "Group"
      And I click "People"
      And I click "edit" in the "Captain AMERICA" row
      And I select "Active" from "Status"
      And I check the box "Creator member"
      And I press "Update membership"
    Then I should see "Creator member" in the "Captain AMERICA" row
      And I click "edit" in the "Iron MAN" row
      And I select "Active" from "Status"
      And I press "Update membership"
    Then I should see "The membership has been updated."

    When I go to "content/league-justice"
      And I click "Group"
      And I click "People"
      And I click "edit" in the "Captain AMERICA" row
      And I select "Active" from "Status"
      And I check the box "Creator member"
      And I press "Update membership"
    Then I should see "Creator member" in the "Captain AMERICA" row
      And I click "edit" in the "Iron MAN" row
      And I select "Active" from "Status"
      And I press "Update membership"
    Then I should see "The membership has been updated."

    When I go to "content/guardians-galaxy"
      And I click "Group"
      And I click "People"
      And I click "edit" in the "Captain AMERICA" row
      And I select "Active" from "Status"
      And I check the box "Creator member"
      And I press "Update membership"
    Then I should see "Creator member" in the "Captain AMERICA" row
      And I click "edit" in the "Iron MAN" row
      And I select "Active" from "Status"
      And I press "Update membership"
    Then I should see "The membership has been updated."

  Scenario: An author can create a request with a questionnaire and duration with changing prices
    Given "request" content:
    | title                       | field_domaine | og_group_ref | author  | field_expiration_date  | status  | field_request_type |
    | How to become a superhero?  | Energy        |              | client1 | 2017-02-08 17:45:00    | 0       | Other              |

    Given I am logged in as "client1"
    When I go to homepage
      And I click "How to become a superhero?" in the "How to become a superhero?" row
    When I click "Edit" in the "primary tabs" region
    Then I should see "500 credits" in the "#edit-field-options-und-questionnaire" element
      And I should see "200 credits" in the "#edit-field-options-und-duration" element

    When I select "Avengers" from "Circles"
      And I press "Save draft"
      And I click "Edit" in the "primary tabs" region
    Then I should see "1000 credits" in the "#edit-field-options-und-questionnaire" element
      And I should see "1000 credits" in the "#edit-field-options-und-duration" element

    When I additionally select "League Of Justice" from "Circles"
      And I press "Save draft"
      And I click "Edit" in the "primary tabs" region
    Then I should see "1000 credits" in the "#edit-field-options-und-questionnaire" element
      And I should see "1300 credits" in the "#edit-field-options-und-duration" element

    Given I check the box "Duration"
    Then I should see "Duration of the mission"
      And I should see "Desired starting date"
    Then I fill in "Duration of the mission" with "1 month"

    Given I check the box "Questionnaire"
    Then I should see "Questions"
      And I fill in "edit-field-request-questions-und-0-value" with "My little questionnaire"

    # Validation page
    Given I press "Continue"
    Then I should see "Request How to become a superhero? has been updated."
      And I should see "1 month"

    Given I press "Publish"
    Then I should have "7700" credits on "client1" user

    # An expert responds to the request.
    Given I am logged in as "expert1"
    When I go to homepage
      And I click "How to become a superhero?" in the "How to become a superhero?" row
      And I should see "My little questionnaire"
