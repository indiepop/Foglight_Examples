Feature: Add registry variables
  In order to manage registry variables
  As a system administrator
  I should create a registry variable

  @mark @ui
  Scenario Outline: Add registry variable
    Given opened 'Dashboards -> Administration -> Rules & Notifications -> Manage Registry Variables ' screen using default credentials
    Then 'Manage Registry Variables' screen should be displayed
    When I click 'Add...' button
    Then 'New Registry Variable Wizard' dialog should be displayed
    When I select '<type>' in 'Select type for registry variable:' field
    And I click 'Next' button
    And I fill 'New Registry Variable Wizard' dialog with next values:
      | Name | test<type> |
    And I click 'Next' button
    Then 'New Registry Variable Wizard' dialog should be displayed
    When I fill 'New Registry Variable Wizard' dialog with next values:
      | <text> | <value> |
    And I click 'Finish' button
    Then 'Edit Registry Variable: test<type>' message should be displayed

  Examples:
    | type    | text                 | value |
    | Double  | Enter desired value: | 123   |
    | Integer | Enter desired value: | 50    |
    | Long    | Enter desired value: | 1234  |
    | String  | Enter desired value: | asdfg |