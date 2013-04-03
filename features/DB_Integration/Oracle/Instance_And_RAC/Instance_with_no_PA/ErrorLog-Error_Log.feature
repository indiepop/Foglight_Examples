Feature: Error Log -> Error Log
  As an administrator role

  @mark
  Scenario: Error Log -> Error Log
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'error-log_nor.png' icon
    Then 'Error Log' screen should be displayed
    Then 'Agent Errors' message should be displayed



