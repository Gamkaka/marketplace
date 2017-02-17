@api @watchdog
Feature: Requests visibility for Référent
  In order to test Requests visibility
  As a Référent
  I want to check if I see the right datas

  Background: og visibility : Create nodes and users

    Given "circle" content:
    | title    | author  |
    | Avengers | admin   |
    | X-Men    | admin   |

    Given "corporate" content:
    | title                 | author  |
    | Marvel Studios        | admin   |
    | Marvel Entertainment  | admin   |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_education  | og_user_node | field_mail                        | field_entreprise     | field_working_status | field_domaine | field_address:country |
    | référent1 | emindhub.test+referent1@gmail.com | référent | Nick             | FURY            | 0612345678      | Skydiving          | Avengers     | emindhub.test+referent1@gmail.com | Marvel Studios       | Other                | Maintenance   | US                    |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_education  | og_user_node | field_mail                      | field_entreprise     | field_working_status | field_domaine | field_address:country |
    | client1 | emindhub.test+client1@gmail.com | business | Captain          | AMERICA           | 0612345678      | Chef de groupe     | Avengers     | emindhub.test+client1@gmail.com | Marvel Studios       | Freelancer           | Maintenance   | US                    |
    | client2 | emindhub.test+client2@gmail.com | business | Charle           | XAVIER          |                 |                    | X-Men        | emindhub.test+client2@gmail.com | Marvel Entertainment | Freelancer           | Engines       | US                    |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_education  | og_user_node | field_mail                      | field_entreprise     | field_working_status | field_domaine | field_address:country |
    | expert1 | emindhub.test+expert1@gmail.com | expert   | Iron             | MAN             | 0712345670      | Chieur génial      | Avengers     | emindhub.test+expert1@gmail.com | Marvel Studios       | Employee             | Energy        | US                    |
    | expert4 | emindhub.test+expert4@gmail.com | expert   | Scott            | SUMMERS         | 0712345673      | Bucheron           | X-Men        | emindhub.test+expert4@gmail.com | Marvel Entertainment | Employee             | Helicopters   | US                    |

    Given "request" content:
    | title         | field_domaine  | og_group_ref    | author  | field_expiration_date  | status  |
    | Fight Magneto | Energy         | X-Men           | client2 | 2017-02-08 17:45:00    | 1       |
    | Fight Ultron  | Energy, Drones | Avengers        | client1 | 2017-02-08 17:45:00    | 1       |
    | Fight Hydra   | Drones         | Avengers        | client1 | 2017-02-08 17:45:00    | 1       |
    | Fight Thanos  | Drones         | Avengers, X-Men | client1 | 2017-02-08 17:45:00    | 1       |

    # Make référent1 as a Referent member of Avengers circle
    Given I am logged in as a user with the "administrator" role
    When I go to "content/avengers"
      And I click "Circle"
      And I click "People"
      And I click "edit" in the "Nick FURY" row
      And I select "Member" from "Status"
      And I check the box "Referent member"
      And I press "Update membership"
    Then I should see "The membership has been updated."
      And I click "edit" in the "Captain AMERICA" row
      And I select "Member" from "Status"
      And I check the box "administrator member"
      And I press "Update membership"
    Then I should see "The membership has been updated."
      And I click "edit" in the "Iron MAN" row
      And I select "Member" from "Status"
      And I press "Update membership"
    Then I should see "The membership has been updated."

    When I go to "content/x-men"
      And I click "Circle" in the "primary tabs" region
      And I click "People"
      And I click "edit" in the "Charle XAVIER" row
      And I select "Member" from "Status"
      And I check the box "administrator member"
      And I press "Update membership"
    Then I should see "The membership has been updated."
      And I click "edit" in the "Scott SUMMERS" row
      And I select "Member" from "Status"
      And I press "Update membership"
    Then I should see "The membership has been updated."

  Scenario: A référent can see the requests from its circles
    Given I am logged in as "référent1"
    When I go to homepage
    Then I should not see "Fight Magneto"
      And I should see "Fight Ultron"
      And I should see "Fight Hydra"
      And I should see "Fight Thanos"

  Scenario: A référent can see experts' full profiles from its circles
    Given I am logged in as "référent1"
    When I go to "users/iron"
    Then I should see "Iron MAN"
      And I should see "Chieur génial"
      And I should see "0712345670"
      And I should see "emindhub.test+expert1@gmail.com"

  Scenario: A référent cannot see experts' full profiles outside of its circles
    Given I am logged in as "référent1"
    When I go to "users/scott"
    Then I should get a "403" HTTP response
