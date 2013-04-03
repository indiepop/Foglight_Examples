Feature: Overview database on Servers Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to overview database

  @yammy @ui @todo
  Scenario: Overview database on Servers Dashboard
    Given opened 'Dashboards -> Management Server -> Servers -> Database Overview' screen using default credentials
    Then 'Database Overview' screen should be displayed