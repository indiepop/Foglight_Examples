Feature: Copy registry variables
  In order to make sure whether copy a registry variables can successed
  As a system administrator
  I should copy a registry variable

  @nancy @ui
  Scenario: Copy registry variable
    Given opened 'Dashboards -> Administration -> Rules & Notifications -> Manage Registry Variables ' screen using default credentials
    Then 'Manage Registry Variables' screen should be displayed
    When I click 'Variable Name' cell in rows in 'Manage Registry Variables' screen grid which contain next values:
      | Variable Name  |
      | AvailabilityCritical |
    Then 'Copy' message should be displayed
    And I click 'Copy' link in 'AvailabilityCritical' popup
    Then 'Copy' dialog should be displayed
    And I click 'OK' button
    Then 'Edit Registry Variable: Copy of AvailabilityCritical' message should be displayed
