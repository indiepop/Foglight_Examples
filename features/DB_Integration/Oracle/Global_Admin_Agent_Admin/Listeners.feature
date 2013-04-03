Feature: Listeners, Verify Listeners dashboard
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario: Listeners
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    When I check rows on 'Databases' screen grid which contain next values:
      | Host      |
      | databases |
    And wait 2 seconds
    And I click 'GlobalAdmin_Link.png' icon
    Then 'Global Administration' screen should be displayed
    And I navigate to 'Oracle -> Listeners' in 'Global Administration' tree
#    Then 'Retrieving Agent Settings' dialog should be displayed
    And 'The Listeners administration screen allows editing the list of monitored listeners per instance, by adding or removing listeners from the list' message should be displayed in 400 seconds


