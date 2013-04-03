Feature: Manage object groups on Object_Groups Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to add, edit object groups

  Background: Go to the same screen
    Given opened 'Dashboards -> Services -> Object Groups' screen using default credentials
    Then 'Object Groups' screen should be displayed
  @yammy @ui
  Scenario Outline: Add object groups on Object Groups Dashboard
    When I click the 1st 'Add' button
    Then 'Create Object Group' dialog should be displayed

    When I fill 'Create Object Group' dialog with next values:
      | Name        | <name>       |
      | Description | This is test |
      | Is Disabled | off          |
    And I click 'Create' button in 'Create Object Group' dialog
    And I refresh the browser
    Then 'Object Groups' screen grid should contain next rows:
      | Name   |
      | <name> |

  Examples:
    | name   |
    | Test   |
    | test   |
    | 1      |
    | .yammy |
    | 珠海虹天|

  @yammy @ui
  Scenario: Edit object groups on Object Groups Dashboard
    When I click in radio in 'Object Groups' screen grid which contain next values:
      | Name |
      | Test |
    And I click 'Edit' button
    Then 'Update Test Object Group' dialog should be displayed

    When I fill 'Update Test Object Group' dialog with next values:
      | Name        | Test           |
      | Description | This is change |
      | Is Disabled | off            |
    And I click 'Update' button in 'Update Test Object Group' dialog
    And I refresh the browser
    Then 'Object Groups' screen grid should contain next rows:
      | Name |
      | Test |


