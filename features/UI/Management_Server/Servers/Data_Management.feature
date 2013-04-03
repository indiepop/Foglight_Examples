Feature: Management data on Servers Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to Management data

  @yammy @ui @todo
  Scenario: Management data on Servers Dashboard
    Given opened 'Dashboards -> Management Server -> Servers -> Database Overview' screen using default credentials
    Then 'Database Overview' screen should be displayed