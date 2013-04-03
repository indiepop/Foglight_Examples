Feature: Alert Log, Verify Alert Log dashboard
  As a  administrator role

  @Regression @Smoke @flora
  Scenario: Alert Log
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    When I check rows on 'Databases' screen grid which contain next values:
      | Host      |
      | databases |
    And wait 2 seconds
    And I click 'GlobalAdmin_Link.png' icon
    Then 'Global Administration' screen should be displayed
    And I navigate to 'Oracle-> Alert Log ' in 'Global Administration' tree
#    Then 'Retrieving Agent Settings' dialog should be displayed
    And 'The Alert Log administration screen allows handling Oracle alerts as follows' message should be displayed in 400 seconds

