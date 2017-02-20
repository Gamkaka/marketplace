@api @watchdog
Feature: Create permissions for Référents
  In order to protect node creation
  As a Référent
  I want to test CRUD

  Background: Create nodes and users

    Given "circle" content:
    | title    | author  |
    | Avengers | admin   |

    Given "corporate" content:
    | title                 | author  |
    | Marvel Studios        | admin   |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_education  | og_user_node | field_mail                      | field_entreprise     | field_working_status | field_domaine |
    | référent1 | emindhub.test+referent1@gmail.com | référent | Nick             | FURY            | 0612345678      | Skydiving          | Avengers     | emindhub.test+referent1@gmail.com | Marvel Studios       | Other | Maintenance |

    # Make référent1 as a Referent member of Avengers circle
    Given I am logged in as a user with the "administrator" role
    When I go to "content/avengers"
      And I click "Administrate" in the "primary tabs" region
      And I click "People" in the "content" region
      And I click "edit" in the "Nick FURY" row
      And I check the box "Referent member"
      And I press "Update membership"
    Then I should see "The membership has been updated."

  Scenario: A référent cann create a request
    Given I am logged in as "référent1"
    When I go to "node/add"
    Then I should see "Request" in the "content" region
