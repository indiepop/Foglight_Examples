Feature: Collection Settings, Verify Collection Settings dashboard
  As a  administrator role

  @Regression @Smoke @flora
  Scenario: Collection Settings
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    When I check rows on 'Databases' screen grid which contain next values:
      | Host      |
      | databases |
    And wait 2 seconds
    And I click 'GlobalAdmin_Link.png' icon
    Then 'Global Administration' screen should be displayed
    And I navigate to 'Oracle -> Collection Settings' in 'Global Administration' tree
#    Then 'Retrieving Agent Settings' dialog should be displayed
    And 'The Locks pane allows setting the following configurations for collecting and displaying data in panes under the Activity > Locks panel:' message should be displayed in 400 seconds


