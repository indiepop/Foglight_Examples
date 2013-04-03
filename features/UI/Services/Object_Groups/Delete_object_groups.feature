Feature: Delete object groups on Object_Groups Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to remove object groups

  Background: Go to the same screen
    Given opened 'Dashboards -> Services -> Object Groups' screen using default credentials
    Then 'Object Groups' screen should be displayed

  @yammy @ui

  Scenario: Delete a object group on Object Groups Dashboard
    When I click in radio in 'Object Groups' screen grid which contain next values:
      | Name |
      | test |
    And I click 'Remove' button
    And I refresh the browser
    Then 'Object Groups' screen grid should not contain next rows:
      | test |
