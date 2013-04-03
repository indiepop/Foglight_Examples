Feature: Manage thresholds on Date Dashboard
  In order to make sure this function work fine
  As a Administration
  I want to Manage thresholds

  @yammy @ui @todo
  Scenario: Manage thresholds on Data Dashboard
    Given opened 'Dashboards -> Administration -> Data -> Manage Thresholds' screen using default credentials
    Then 'Manage Thresholds' screen should be displayed
    And opened 'Dashboards -> Administration' screen