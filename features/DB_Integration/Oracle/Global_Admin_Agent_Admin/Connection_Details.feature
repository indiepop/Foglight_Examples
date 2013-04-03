Feature: Connection Detail, Verify Connection detail dashboard
  As a  administrator role

  @Regression @Smoke @flora
  Scenario: Connection Details
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    When I check rows on 'Databases' screen grid which contain next values:
      | Host      |
      | databases |
    And wait 2 seconds
    And I click 'GlobalAdmin_Link.png' icon
    Then 'Global Administration' screen should be displayed
    And I navigate to 'Oracle -> Connection Details' in 'Global Administration' tree
#    Then 'Retrieving Agent Settings' dialog should be displayed
    And 'The Connection Details administration screen allows defining connection settings for one or more of the instances listed below' message should be displayed in 400 seconds


