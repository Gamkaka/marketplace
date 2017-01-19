@api @watchdog
Feature: Request and answers
  In order to test Request with Anonymous option
  As a Client and an Expert
  I want to create a request, and watch author informations

  Background: Create request

    Given "circle" content:
    | title    | author  |
    | Avengers | admin   |

    Given "corporate" content:
    | title                 | author  |
    | Marvel Studios        | admin   |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_other_areas  | og_user_node | field_mail                      | field_entreprise     | field_working_status | field_domaine |
    | client1 | emindhub.test+client1@gmail.com | business | Captain          | AMERICA         | 0612345678      | Chef de groupe     | Avengers     | emindhub.test+client1@gmail.com | Marvel Studios       | Freelancer           | Maintenance |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_other_areas  | og_user_node | field_mail                      | field_entreprise     | field_working_status | field_domaine |
    | expert1 | emindhub.test+expert1@gmail.com | expert   | Iron             | MAN             | 0712345670      | Chieur génial      | Avengers     | emindhub.test+expert1@gmail.com | Marvel Studios     | Employee             | Energy        |

    Given "request" content:
    | title                       | field_domaine | og_group_ref | author  | field_expiration_date  | status  | field_request_type |
    | How to become a superhero?  | Energy        | Avengers     | client1 | 2017-02-08 17:45:00    | 0       | Mission            |

    Given I give "client1" 10000 emh credits

    Given I am logged in as a user with the "administrator" role
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

  Scenario: The author choose to hide its name
    Given I am logged in as "client1"
    When I go to "requests/manage"
      And I click "How to become a superhero?" in the "How to become a superhero?" row
      And I click "Edit" in the "primary tabs" region
      And I check "Anonymous"
      And I check "Hide my name"
      And I press "Continue"
    # Validation page
      Then I should see "My name will be hidden"

    When I press "Publish"
    Then I should see the success message "Request How to become a superhero? has been published."

    Given I am logged in as "expert1"
    When I go to homepage
      And I click "How to become a superhero?" in the "How to become a superhero?" row
    Then I should not see "Captain AMERICA" in the "request_right" region
      And I should see "Anonymous" in the "request_right" region

  Scenario: The author choose to hide its organisation
    Given I am logged in as "client1"
    When I go to "requests/manage"
      And I click "How to become a superhero?" in the "How to become a superhero?" row
      And I click "Edit" in the "primary tabs" region
      And I check "Anonymous"
      And I check "Hide my organisation"
      And I press "Continue"
    # Validation page
    Then I should see "My organisation will be hidden"

    When I press "Publish"
    Then I should see the success message "Request How to become a superhero? has been published."

    Given I am logged in as "expert1"
    When I go to homepage
      And I click "How to become a superhero?" in the "How to become a superhero?" row
    Then I should not see "Marvel Studios" in the "request_right" region

  Scenario: The author choose to hide its name & organisation and show its activity
    Given I am logged in as "client1"
    When I go to "requests/manage"
      And I click "How to become a superhero?" in the "How to become a superhero?" row
      And I click "Edit" in the "primary tabs" region
      And I check "Anonymous"
      And I check "Hide my name"
      And I check "Hide my organisation"
      And I enter "ALMIGHTY GOD" for "We suggest you give at least some information about your activity"
      And I press "Continue"
    # Validation page
      And I press "Publish"
    Then I should see the success message "Request How to become a superhero? has been published."

    Given I am logged in as "expert1"
    When I go to homepage
      And I click "How to become a superhero?" in the "How to become a superhero?" row
    Then I should not see "Captain AMERICA" in the "request_right" region
      And I should not see "Marvel Studios" in the "request_right" region
      And I should see "ALMIGHTY GOD" in the "request_right" region
