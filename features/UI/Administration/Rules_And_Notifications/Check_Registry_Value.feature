Feature: Check registry value
  In order to make sure this function works fine
  As a Administration
  I want to check registry value

  @yammy @ui @todo
  Scenario: Check registry value
    Given opened 'Dashboards -> Administration -> Rules & Notifications -> Check Registry Value' screen using default credentials
    Then 'View Registry Value' screen should be displayed