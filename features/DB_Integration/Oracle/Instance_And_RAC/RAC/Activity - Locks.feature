Feature: Activity -> Locks
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario:  Activity - Locks
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click "Home Page" button
  #  Click on 'Activity' icon on the toolbar, click on 'Locks' option
    And I click "Activity" button
    And I click 'Locks' link
  # Data is seen under 'Locks' Pane
    Then 'Locks' message is displayed, Data is seen under 'Locks' Pane

  # Verify 'Locks Overview' tab
  # The charts are presented on both baseline and breakdown modes
    And I click 'Breakdown' link
    And     I click 'Baseline' link
  # verify 'Lock Wait Time Breakdown' pie is presented
    Then 'There are no Lock Waits to display' message is displayed

  # 'Locks Efficiency' bar is colored according to its value
    And 'Locks Efficiency' bar is colored as green

  # 'Locks Activity' tab, Data is seen in the grids
    And I click 'Locks Activity' tab
    Then  'Locks Activity' gird should not contain 'n/a'

  # 'Locks Tree (Current)' tab , Data is seen in the grids    ,
    And  I click 'Locks Tree (Current)' tab
    Then 'Current Locks' gird should not contain 'n/a'

  #  Press the SID number of a locked session. Verify that the 'Session X Details' screen is opened and included data in all fields


  # 'Locks Historical Tree' tab , The Lock Wait (Average Active Sessions) chart is presented on both baseline and breakdown modes
    And I click 'Locks Historical Tree' tab
    Then 'Lock Wait (Average Active Sessions) ' chart is displayed

    And I click 'Breakdown' link
    And I  click 'Baseline' link



  # Click on the link at the upper-left corner of 'Locks Exceeding 90 seconds' chart and change the 'Longest duration' to Number of Locks option. Verify that the data is presented in the chart
  # Click on 'Displaying snapshots' grid. Verify that the 'Lock Tree for Selected Snapshot' is opened

