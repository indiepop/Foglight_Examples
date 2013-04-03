Feature: View hosts resource on Hosts Dashboard
  In order to mark sure this function works fine
  As a Administration
  I want to view hosts resource

  @yammy @ui
  Scenario: View hosts resource on Hosts Dashboard
    Given opened 'Dashboards -> Hosts -> Host Resource' screen using default credentials
    Then 'Resource Use on yammy-win2k364 (Host)' screen should be displayed