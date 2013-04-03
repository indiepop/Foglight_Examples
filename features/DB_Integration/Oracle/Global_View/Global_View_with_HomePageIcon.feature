Feature: Global View
  As a  administrator role

  @mark
  Scenario:  Verify Global View by click HomePageIcon
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click 'HomePageIcon-16.png' icon
    Then '10.30.149.39-ORCL' screen should be displayed
    And I close browser