Feature: View hosts data on Hosts Dashboard
  In order to mark sure this function works fine
  As a Administration
  I want to view hosts data

  @yammy @ui @todo
  Scenario: View hosts data on Hosts Dashboard
    Given opened 'Dashboards -> Hosts -> Host Browser' screen using default credentials
    Then 'Host' screen should be displayed
