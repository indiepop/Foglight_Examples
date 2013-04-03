Feature: Activity -> Usability
  Click on 'Activity' icon on the toolbar, click on 'Usabiity' option  Data is seen under 'Instance Usability' Pane

  - There is no data either for chart and legend of Listener for Oracle instances monitoring on Windows platform. In order to display it the Listener configuration details should be added to ASP
    Click on The Alarms in case the Alarms appear at the top-right side of the screen  Alarms window opens and displaying usability-related alarms


  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario:  Activity Screen
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click "Home Page" button
  #  Click on 'Activity' icon on the toolbar, click on 'Usability' option
    And I click 'Usability' link
  # Data is seen under 'Instance Usability' Pane
    Then 'Instance Usability' message is displayed
    And '10.2.0.1.0' message is displayed

  # Click on The Alarms in case the Alarms appear at the top-right side of the screen
    And I click  'alarm' table
    Then the title in popup should contain 'ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102'