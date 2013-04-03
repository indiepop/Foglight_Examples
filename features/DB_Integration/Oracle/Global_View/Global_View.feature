Feature: Global View
  As a  administrator role

  @mark
  Scenario:  Verify Global View
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I check rows on 'Databases' screen grid which contain next values:
      | Host      |
      | databases |
    And I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    And I click 'HomePageLink.png' icon
    Then '10.30.149.39-ORCL' screen should be displayed
    And I close browser




