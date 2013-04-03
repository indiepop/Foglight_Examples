Feature: Create rule
  In order to make sure this function works fine
  As a Administration
  I want to create rule

  @yammy @ui @todo
  Scenario: create rule
    Given opened 'Dashboards -> Administration -> Rules & Notifications -> Create Rule' screen using default credentials
    Then 'Create Rule' screen should be displayed