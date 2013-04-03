Feature: Rule diagnostics
  In order to make sure this function works fine
  As a Administration
  I want to rule diagnostics

  @yammy @ui @todo
  Scenario: Rule diagnostics
    Given opened 'Dashboards -> Administration -> Rules & Notifications -> Rule Diagnostics' screen using default credentials
    Then 'Rule Diagnostics' screen should be displayed