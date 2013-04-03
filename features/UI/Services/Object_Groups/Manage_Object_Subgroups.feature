Feature: Manage object subgroups on Object Groups Dashboard
  In order to make sure this function works fine
  In order to make sure this function works fine
  As a Administration
  I want to add, edit and remove object subgroups

  Background: Go to the same screen
    Given opened 'Dashboards -> Services -> Object Groups' screen using default credentials
    Then 'Object Groups' screen should be displayed

  @yammy @ui

  Scenario Outline: Add object subgroups on Object Groups Dashboard
    When I click the 2st 'Add' button
    Then 'Create Object SubGroup' dialog should be displayed
    When I fill 'Create Object SubGroup' dialog with next values:
      | Name             | <name>          |
      | Description      | This is subtest |
      | Data Type        | FSMCategory     |
      | Query Conditions | test            |
      | Is Disabled      | on              |
    Then 'Create[enabled]' button should be displayed in 30 seconds
    When I click 'Create' button in 'Create Object SubGroup' dialog
    And I refresh the browser
    Then the 2rd grid should contain next rows:
      | <name> |

  Examples:
    | name   |
    | Test   |
    | test   |
    | 1      |
    | .yammy |
    | 珠海虹天   |


  @yammy @ui

  Scenario: Delete object subgroups on Object Groups Dashboard
    When I check rows on 2st grid in 'Object Groups' screen which contain next values:
      | Name   |
      | test   |
      | 1      |
      | .yammy |
      | 珠海虹天   |
    Then 'Remove[enabled]' button should be displayed in 30 seconds
    When I click 'Remove' button
    Then the 2rd grid should not contain next rows:
      | test   |
      | 1      |
      | .yammy |
      | 珠海虹天   |




