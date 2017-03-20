@api @watchdog
Feature: SmartMobility circle test
  In order to test SmartMobility module
  As a member of the circle
  I want to check if I get SmartMobility features.

  Background: Create nodes and users

    Given "corporate" content:
    | title                 | author  |
    | Marvel Studios        | admin   |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_education  | og_user_node | field_mail                      | field_entreprise     | field_working_status | field_domaine | field_address:country |
    | client1 | emindhub.test+client1@gmail.com | business | Captain          | AMERICA         | 0612345678      | Chef de groupe     | Smart Mobility     | emindhub.test+client1@gmail.com | Marvel Studios       | Freelancer           | Maintenance   | US                    |

  Scenario: Test if basic login still works
    When I visit 'user/login'
    And I fill in "admin" for "name"
    And I fill in "admin" for "pass"
    And I press the "Log in" button
    Then I should see the text "Log out"

  Scenario: Clients can see the requests
    Given I am logged in as a user with the "administrator" role

    When I go to "content/smart-mobility"
      And I click "Administrate" in the "primary tabs" region
      And I click "People" in the "content" region
      And I click "edit" in the "Captain AMERICA" row
      And I select "Member" from "Status"
      And I check the box "administrator member"
      And I press "Update membership"
    Then I should see "The membership has been updated."

    Given I am logged in as "client1"
    Then I should see "Smart mobility"
      And I should see "How it works"
