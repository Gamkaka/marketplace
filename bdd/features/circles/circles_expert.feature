@api @watchdog
Feature: Requests visibility for Expert
  In order to test Requests visibility
  As an Expert
  I want to check if I see the right datas

  Background: og visibility : Create requests and answers

    Given "circle" content:
    | title    | author  |
    | Avengers | admin   |
    | X-Men    | admin   |

    Given "corporate" content:
    | title                 | author  |
    | Marvel Studios        | admin   |
    | Marvel Entertainment  | admin   |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_education  | og_user_node | field_mail                      | field_entreprise     | field_working_status | field_domaine | field_address:country |
    | client1 | emindhub.test+client1@gmail.com | business | Captain          | AMERICA         | 0612345678      | Chef de groupe     | Avengers     | emindhub.test+client1@gmail.com | Marvel Studios       | Freelancer           | Aviation   | US                    |
    | client2 | emindhub.test+client2@gmail.com | business | Charle           | XAVIER          |                 |                    | X-Men        | emindhub.test+client2@gmail.com | Marvel Entertainment | Freelancer           | Blockchain       | US                    |

    Given users:
    | name    | mail                            | roles    | field_first_name | field_last_name | field_address:mobile_number | field_education  | og_user_node | field_mail                      | field_entreprise     | field_working_status | field_domaine | field_address:country |
    | expert1 | emindhub.test+expert1@gmail.com | expert   | Iron             | MAN             | 0712345670      | Chieur génial      | Avengers     | emindhub.test+expert1@gmail.com | Marvel Studios       | Employee             | Blockchain        | US                    |
    | expert4 | emindhub.test+expert4@gmail.com | expert   | Scott            | SUMMERS         | 0712345673      | Bucheron           | X-Men        | emindhub.test+expert4@gmail.com | Marvel Entertainment | Employee             | Energy   | US                    |

    Given "request" content:
    | title         | field_domaine  | og_group_ref    | author  | field_expiration_date  | status  |
    | Fight Magneto | Blockchain         | X-Men           | client2 | 2020-02-08 17:45:00    | 1       |
    | Fight Ultron  | Blockchain, Aviation | Avengers        | client1 | 2020-02-08 17:45:00    | 1       |
    | Fight Hydra   | Aviation         | Avengers        | client1 | 2020-02-08 17:45:00    | 1       |
    | Fight Thanos  | Aviation         | Avengers, X-Men | client1 | 2020-02-08 17:45:00    | 1       |

    Given the user "client1" is an admin of the group "Avengers"
    Given the user "expert1" is a member of the group "Avengers"
    Given the user "client2" is an admin of the group "X-Men"
    Given the user "expert4" is a member of the group "X-Men"

  Scenario: Experts can see the requests
    Given I am logged in as "expert1"
    When I go to homepage
    Then I should not see "Fight Magneto"
      And I should see "Fight Ultron"
      And I should see "Fight Hydra"
      And I should see "Fight Thanos"

    Given I am logged in as "expert4"
    When I go to homepage
    Then I should see "Fight Magneto"
      And I should not see "Fight Ultron"
      And I should not see "Fight Hydra"
      And I should see "Fight Thanos"
