Feature: Test for Home page when instance with no PA
  Activity Screen:  Hover over the 'Activity' icon on the toolbar (second icon on the toolbar) , Tooltip is displayed with the word 'Activity'
  Click on 'Activity' icon on the toolbar ,  'Activity' options open

  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario:  Activity Screen
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click "Home Page" button
  # Hover over the 'Activity' icon on the toolbar (second icon on the toolbar) , Tooltip is displayed with the word 'Activity'
    And I hover over the 'Activity' button
    Then 'Activity' tooltip is displayed

  # Click on 'Activity' icon on the toolbar ,  'Activity' options open
    And I click "Activity" button
    Then  'Usability' message is displayed
