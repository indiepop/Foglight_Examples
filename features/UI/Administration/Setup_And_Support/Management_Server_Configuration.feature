Feature: Management server configuration on Setup & Support Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to do management server configuration

  @yammy @ui @todo
  Scenario: View connection status on Setup & Support Dashboard
    Given opened 'Dashboards -> Administration -> Setup & Support -> Management Server Configuration' screen using default credentials
    Then 'Management Server Configuration' screen should be displayed
