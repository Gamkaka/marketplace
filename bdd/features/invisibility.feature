@api
Feature: Test visibility
  In order to test emh requests visibility
  As anonymous, clients, and experts
  I want to check if I see the right datas

  Background: Create questions and answers
    Given users:
    | name    | mail                 | roles    | field_first_name | field_last_name |
    | client1 | client1@emindhub.com | business | Steve            | Rogers          |
    | client2 | client2@emindhub.com | business | Charles          | Xavier          |
    | client3 | client3@emindhub.com | business | Silver           | Surfer          |
    Given "circle" content:
    | title    | author  | group_access | 
    | Avengers | client1 | Private |
    | X-Men    | client2 | Private |
    Given users:
    | name    | mail                 | roles    | field_first_name | field_last_name | og_user_node |
    | expert1 | expert1@emindhub.com | expert   | Iron             | Man             | Avengers     |
    | expert2 | expert2@emindhub.com | expert   | Klark            | Kent            | Avengers     |
    | expert3 | expert3@emindhub.com | expert   | Bruce            | Banner          | Avengers     |
    | expert4 | expert4@emindhub.com | expert   | Scott            | Summers         | X-Men        |
    | expert5 | expert5@emindhub.com | expert   | Jean             | Grey            | X-Men        |
    Given I give "client1" 400 emh points
    Given I give "client2" 100 emh points
    Given "question1" content:
    | title         | field_domaine  | og_group_ref   | field_reward | author  |
    | Fight Magneto | Energy         | X-Men          | 100          | client2 |
    | Fight Ultron  | Energy, Drones | Avengers       | 100          | client1 |
    | Fight Hydra   | Drones         | Avengers       | 100          | client1 |
    | Fight Thanos  | Drones         | Avengers | 100          | client1 |
    Given "challenge" content:
    | title         | field_domaine  | og_group_ref    | field_reward | author  |


  Scenario: Test visibility
    Given I am logged in as a user with the "webmaster" role
    When I go to homepage
    Then I should see "Fight Magneto"
    And I should see "Fight Ultron"
    And I should see "Fight Hydra"
    And I should see "Fight Thanos"
    Given I am logged in as "client1"
    Then I should not see "Fight Magneto"
    And I should see "Fight Ultron"
    And I should see "Fight Hydra"
    And I should see "Fight Thanos"
    Given I am logged in as "client2"
    Then I should see "Fight Magneto"
    And I should not see "Fight Ultron"
    And I should not see "Fight Hydra"
    And I should not see "Fight Thanos"
    Given I am logged in as "expert1"
    Then I should not see "Fight Magneto"
    And I should see "Fight Ultron"
    And I should see "Fight Hydra"
    And I should see "Fight Thanos"
    Given I am logged in as "expert4"
    Then I should see "Fight Magneto"
    And I should not see "Fight Ultron"
    And I should not see "Fight Hydra"
    And I should not see "Fight Thanos"
    Given I am not logged in
    When I go to homepage
    Then I should not see "Fight Magneto"
    And I should not see "Fight Ultron"
    And I should not see "Fight Hydra"
    And I should not see "Fight Thanos"
    When I go to "/node"
    Then I should not see "Fight Magneto"
    And I should not see "Fight Ultron"
    And I should not see "Fight Hydra"
    And I should not see "Fight Thanos"