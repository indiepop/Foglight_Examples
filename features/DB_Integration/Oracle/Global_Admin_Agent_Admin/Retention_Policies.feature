Feature: Retention Policies, Verify Retention Policies dashboard
  As a  administrator role

  @Regression @Smoke @flora
  Scenario: Retention Policies
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    When I check rows on 'Databases' screen grid which contain next values:
      | Host      |
      | databases |
    And wait 2 seconds
    And I click 'GlobalAdmin_Link.png' icon
    Then 'Global Administration' screen should be displayed
    And I navigate to 'Oracle -> Retention Policies' in 'Global Administration' tree
#    Then 'Retrieving Agent Settings' dialog should be displayed
    And 'Retention Policy is used for defining the requested duration for which collection data' message should be displayed in 400 seconds


