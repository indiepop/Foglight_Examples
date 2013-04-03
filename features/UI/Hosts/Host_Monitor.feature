Feature: View hosts on Hosts Dashboard
  In order to mark sure this function works fine
  As a Administration
  I want to view hosts

  @yammy @ui
  Scenario: View hosts on Hosts Dashboard
    Given opened 'Dashboards -> Hosts -> Host Monitor' screen using default credentials
    Then 'yammy-win2k364' screen should be displayed