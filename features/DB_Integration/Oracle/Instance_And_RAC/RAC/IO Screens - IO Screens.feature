Feature: IO Screens
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario: IO Screens
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click 'ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102' link
    And I click "Home" button of current selected row in gird on 'Database' screen
    And I click "I/O" button
    And I click 'I/O' link
    Then 'I/O' panel should be displayed




