Feature: Activity -> Event Categories Breakdown
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario:  Activity - Event Categories Breakdown
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click "Home Page" button
  #  Click on 'Activity' icon on the toolbar, click on 'Event Categories Breakdown' option
    And I click "Activity" button
    And I click 'Event Categories Breakdown' link
  # Data is seen under 'Event Categories Breakdown' Pane
    Then 'Event Categories Breakdown' message is displayed
    And 'Workload (Average Active Sessions)'legend is displayed
  # Click on the title Wait Categories for Selected Periods, A popup that allows choosing between the following options: Current wait time and Period wait time appears
    And I click 'Current Wait Categories' link
    And    I click 'Current' link
  # Click on 'All wait events...' left-bottom corner, 'All Wait Events' popup open
    And I click 'All wait events...' link
    Then 'All Wait Events' popup should be displayed
    And 'All Wait Events' gird should not contain 'n/a'


