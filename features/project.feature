    Feature: Project
     In order to organize my projects
     As a Information Tecnology company
     I want create and manage projects

      Scenario: Project list
        Given I have project named Tiberius, Caligula
        When I go to the list of projects
        Then I should see "Tiberius"
        And I should see "Caligula"

      Scenario: Create project
        Given I have no project
        And I am on the list of projects
        When I follow "New Project"
        And I fill in "Name" with "Tiberius"
        Then I press "Create"
        Then I should see "Project was successfully created"
        And I should see "Tiberius"
        And I should have 1 project

       Scenario: Destroy project
        Given I have project named Tiberius
        And I am on the list of projects
        When I follow "Destroy"
        And I should not see "Tiberius"

       Scenario: Update project
        Given I have project named Caligula
        And I am on the list of projects
        When I follow "Edit"
        And I fill in "Name" with "Tiberius"
        Then I press "Update"
        Then I should see "Project was successfully updated"
        And I should not see "Caligula"
        And I should see "Tiberius"

       Scenario: Show project
        Given I have project named Tiberius
        And I am on the list of projects
        When I follow "Show"
        And I should see "Tiberius"

