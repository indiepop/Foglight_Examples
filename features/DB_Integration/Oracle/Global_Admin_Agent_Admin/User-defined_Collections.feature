Feature: User-defined Collections, Verify User-defined Collections dashboard
  As a  administrator role

  @Regression @Smoke @flora
  Scenario: User-defined Collections
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    When I check rows on 'Databases' screen grid which contain next values:
      | Host      |
      | databases |
    And wait 2 seconds
    And I click 'GlobalAdmin_Link.png' icon
    Then 'Global Administration' screen should be displayed
    And I navigate to 'Oracle -> User-defined Collections' in 'Global Administration' tree
#    Then 'Retrieving Agent Settings' dialog should be displayed
    And 'The user-defined collections administration screen is used for adding user-defined collections to' message should be displayed in 400 seconds





