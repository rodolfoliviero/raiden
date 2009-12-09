Feature: Manage stories
  In order to make my backlog
  As a Product Manager
  I want create and manage stories

  Scenario: Create story
        Given I have project named Tiberius
        And I have no story
        And I am on the list of projects
        And I follow "Show"
        When I follow "New story"
        And I fill in "Name" with "New story"
        And I fill in "Description" with "Description"
        And I fill in "points" with "5"
        And I press "Create"
        Then I should see "Story was successfully created"
        And I should see "Tiberius"
        And I should see "New story"
        And I should have 1 stories

   Scenario: Destroy story
        Given I have project named Tiberius
        And Tiberius has story named "empire"
        And I am on the list of projects
        And I follow "Show"
        When I follow "Destroy story"
        Then I should not see "empire"
        And I should have 0 stories

