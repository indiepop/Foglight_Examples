Feature: Activity -> Storage
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario:  Activity - Storage
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
   And I click "Home" button of current selected row in gird on 'Database' screen

#    Hover over the 'Storage' icon on the toolbar (fourth icon on the toolbar)  Tooltip is displayed with the word 'Storage'
 # Click on 'Storage' icon on the toolbar  'Storage' options open
    And I click "Activity" button
    And I click 'Storage' link
  # Data is seen under 'Event Categories Breakdown' Pane
    Then 'Storage' message is displayed


