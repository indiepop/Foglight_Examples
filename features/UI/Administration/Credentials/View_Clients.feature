Feature: View Clients
  In order to View Clients
  As a system administrator
  I should go to Credentials dashboards

  @mark @ui
  Scenario: Edit Credential Properties
    Given opened 'Dashboards->Administration->Credentials' screen using default credentials
    Then 'Credentials' screen should be displayed
    When I click 'View Clients' link
    Then 'View Clients' screen should be displayed in 400 seconds
    And 'View Clients' screen grid should contain next rows:
      | Name           | Client Type |
      | yammy_win2k364 | FglAM       |