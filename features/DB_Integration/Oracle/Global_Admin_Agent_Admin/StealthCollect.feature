Feature: StealthCollect, Verify StealthCollect dashboard
  As a  administrator role

  @Regression @Smoke @flora
  Scenario: StealthCollect
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    When I check rows on 'Databases' screen grid which contain next values:
      | Host      |
      | databases |
    And wait 2 seconds
    And I click 'GlobalAdmin_Link.png' icon
    Then 'Global Administration' screen should be displayed
    And I navigate to 'Oracle -> StealthCollect' in 'Global Administration' tree
#    Then 'Retrieving Agent Settings' dialog should be displayed
    And 'The StealthCollect global administration screen allows maintaining the connection to StealthCollect' message should be displayed


