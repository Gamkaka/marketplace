@api @watchdog
Feature: Buy profile access
  In order to test profile access purchasing
  As a Client and an Expert
  I want to buy a profile and watch it

  Background: Create request

    Given "corporate" content:
    | title     | author  |
    | Google    | admin   |
    | Facebook  | admin   |

    Given users:
    | name    | mail                 | roles    | field_first_name | field_last_name | field_other_areas  | og_user_node | field_mail           | field_entreprise  | field_working_status  | field_domaine |
    | client1 | emindhub.test+client1@gmail.com | business | Captain          | AMERICA         | Chef de groupe     | All experts     | emindhub.test+client1@gmail.com | Google  | Freelancer | Maintenance |
    | expert1 | emindhub.test+expert1@gmail.com | expert   | Iron             | MAN             | Chieur génial      | All experts     | emindhub.test+expert1@gmail.com | Facebook  | Employee  | Energy        |

    # Just in case...
    Given I run drush "vset" "--yes emh_request_send_notification_email_all_domains FALSE"

    Given "request" content:
    | title                       | field_domaine | og_group_ref | author  | field_expiration_date  | status  |
    | How to become a superhero?  | Energy        | All experts     | client1 | 2017-02-08 17:45:00    | 1       |

    Given I give "client1" 1000 emh points
    Given I give "expert1" 500 emh points

    # Make client1 as a Creator member of Avengers circle
    Given I am logged in as a user with the "administrator" role
    When I go to "content/all-experts"
      And I click "Group"
      And I click "People"
      And I click "edit" in the "Captain AMERICA" row
      And I check the box "Creator member"
      And I press "Update membership"
    Then I should see "Creator member" in the "Captain AMERICA" row

    # An expert responds to the request.
    Given I am logged in as "expert1"
    When I go to homepage
      And I click "How to become a superhero?" in the "How to become a superhero?" row
      And I fill in "How to become a superhero?" with "Everybody can be, trust me, I'm the best we known."
      And I press "Publish"
    Then I should see the message "Your submission has been published."

  Scenario: An author can buy a profile
    Given I am logged in as "client1"
    When I go to "content/how-become-superhero"
    Then I should see "Iron" in the "submissions" region
      And I should not see "MAN" in the "submissions" region
      And I should see "Buy profile access for 50pts" in the "submissions" region

    When I click "Buy profile access for 50pts" in the "submissions" region
    Then I should see "Buy profile access"

    When I click "Access profile"
    Then I should see "Iron MAN" in the "submissions" region
      And I should have "950" points on "client1" user
      And I should have "550" points on "expert1" user

    When I go to "circles/relationships"
    Then I should see "Iron MAN"

  @exclude
  Scenario: An expert can buy an author profile
    Given I am logged in as "expert1"
    When I go to "content/how-become-superhero"
    Then I should see "Captain" in the "request_right" region
      And I should not see "AMERICA" in the "request_right" region
      And I should see "Buy profile access for 50pts" in the "request_right" region

    When I click "Buy profile access for 50pts" in the "request_right" region
    Then I should see ""

    When I click "Access profile"
    Then I should see ""
      And I should have "450" points on "expert1" user
      And I should have "1050" points on "client1" user

    When I go to "content/how-become-superhero"
    Then I should see "Captain AMERICA" in the "request_right" region

    When I go to "circles/relationships"
    Then I should see "Captain AMERICA"