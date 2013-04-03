Feature: Connection status on Setup & Support Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to do view connection status

  @yammy @ui @todo
  Scenario: View connection status on Setup & Support Dashboard
    Given opened 'Dashboards -> Administration -> Setup & Support -> Connection Status' screen using default credentials
    Then 'Connection Status' screen should be displayed
