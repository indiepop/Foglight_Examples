Feature: On-demand Data Port, Verify On-demand Data Port dashboard
  As a  administrator role

  @Regression @Smoke @flora
  Scenario: On-demand Data Port
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    When I check rows on 'Databases' screen grid which contain next values:
      | Host      |
      | databases |
    And wait 2 seconds
    And I click 'GlobalAdmin_Link.png' icon
    Then 'Global Administration' screen should be displayed
    And I navigate to 'Oracle -> On-demand Data Port' in 'Global Administration' tree
#    Then 'Retrieving Agent Settings' dialog should be displayed
    And 'The On-demand Data Port global administration screen allows defining a port for each Foglight Agent Manager (FglAM) to be used for retrieving data and integrating with StealthCollect' message should be displayed in 400 seconds


