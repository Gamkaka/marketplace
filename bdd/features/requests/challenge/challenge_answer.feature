@api @watchdog
Feature: Challenge and answers
  In order to test Challenge creation, and privacy of answers
  As a Client and an Expert
  I want to create a Challenge, and watch answers

  Background: Create challenge

    Given "circle" content:
    | title    | author  |
    | Avengers | admin   |

    Given "corporate" content:
    | title     | author  |
    | Google    | admin   |
    | Facebook  | admin   |
    | Twitter   | admin   |

    Given users:
    | name    | mail                 | roles    | field_first_name | field_last_name | field_telephone | field_other_areas  | og_user_node | field_mail           | field_entreprise  | field_working_status  | field_domaine |
    | client1 | emindhub.test+client1@gmail.com | business | Captain          | America         | 0612345678      | Chef de groupe     | Avengers     | emindhub.test+client1@gmail.com | Google  | Freelancer | Maintenance |
    | expert1 | emindhub.test+expert1@gmail.com | expert   | Iron             | Man             | 0712345670      | Chieur génial      | Avengers     | emindhub.test+expert1@gmail.com | Facebook  | Employee  | Energy        |
    | expert2 | emindhub.test+expert2@gmail.com | expert   | Klark            | Kent            | 0712345671      | Modèle             | Avengers     | emindhub.test+expert2@gmail.com | Twitter   | Employee  | Other         |

    Given I give "client1" 3000 emh points

    Given "challenge" content:
    | title        | field_domaine | og_group_ref | field_reward | author  | field_anonymous      | field_show_entreprise | field_use_my_entreprise |
    | What about?  | Energy        | Avengers     | 1000         | client1 | Display my full name | Display the name      | Display                 |

    # An expert can respond to the challenge
    Given I am logged in as "expert2"
    And I am on the homepage
    Then I should see "What about?"

    When I click "What about?" in the "What about?" row
    #Then I should see an "Answer" textarea form element
    Given I enter "The truth is elsewhere." for "Answer"
    And I press "Publish"

  Scenario: An expert can see its own answer
    Given I am logged in as "expert2"
    And I am on the homepage
    When I click "What about?" in the "What about?" row
    Then I should see "Answers"
    And I should see "Klark Kent"
    And I should see "The truth is elsewhere."

  Scenario: The author can see the answer
    Given I am logged in as "client1"
    When I go to "my-responses"
    Then I should see "Klark Kent"
    And I should see "The truth is elsewhere." in the "Klark Kent" row

    When I go to the homepage
    Then I should see "1" in the "What about?" row

    When I click "What about?" in the "What about?" row
    #Then I should not see an "Answer" textarea form element
    And I should see "Answers"
    And I should see "Klark Kent"
    And I should see "The truth is elsewhere."

  Scenario: Another expert cannot see the answer
    Given I am logged in as "expert1"
    And I am on the homepage
    When I click "What about?" in the "What about?" row
    Then I should not see "Klark Kent"
    And I should not see "The truth is elsewhere."

  Scenario: The expert can edit its own answer
    Given I am logged in as "expert2"
    And I am on the homepage
    When I click "What about?" in the "What about?" row
    And I click "edit" in the "answers" region
    And I enter "The truth is here." for "Answer"
    And I press "Save"
    Then I should see "The truth is here."

  Scenario: The author cannot edit an answer
    Given I am logged in as "client1"
    And I am on the homepage
    When I click "What about?" in the "What about?" row
    Then I should not see the link "edit" in the "answers" region

  Scenario: The expert cannot delete its own answer
    Given I am logged in as "expert2"
    And I am on the homepage
    When I click "What about?" in the "What about?" row
    Then I should not see "delete" in the "answers" region

  Scenario: The author cannot delete an answer
    Given I am logged in as "client1"
    And I am on the homepage
    When I click "What about?" in the "What about?" row
    Then I should not see "delete" in the "answers" region