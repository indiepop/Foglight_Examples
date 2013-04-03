Feature: Activity -> Locks
  As a administrator role

  @mark @TODO
  Scenario: Activity - Locks
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
  #    Then '10.30.149.39-ORCL' screen should be displayed
    When I click 'activity.png' icon
    Then '[unnamed]' popup should be displayed
    And I click 'Locks' link in '[unnamed]' popup
    Then 'Lock Wait (Average Active Sessions)' message should be displayed
#    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
#    And I click 'ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102' link
#    And I click "Home Page" button
#  #  Click on 'Activity' icon on the toolbar, click on 'Locks' option
#    And I click "Activity" button on toolbar
#    And I click 'Locks' link
#  # Data is seen under 'Locks' Pane
#    And 'Lock Wait (Average Active Sessions)' chart title is displayed
#
#  # Verify 'Locks Overview' tab
#  # The charts are presented on both baseline and breakdown modes
#    And I click 'Breakdown' link
#    And I click 'Baseline' link
#  # verify 'Lock Wait Time Breakdown' pie is presented
#    Then 'There are no Lock Waits to display' message is displayed
#
#  # 'Locks Efficiency' bar is colored according to its value
#    And 'Locks Efficiency' bar should 100% green
#
#  # 'Locks Activity' tab, Data is seen in the grids
#    And I click 'Locks Activity' tab
#    And 'Locks Activity' grid should not contain 'n/a'
#
#  # 'Locks Tree (Current)' tab , Data is seen in the grids
#    And I click 'Locks Tree (Current)' tab
#    And 'Locks Tree (Current)' grid should not contain 'n/a'
#
#  #  Press the SID number of a locked session. Verify that the 'Session X Details' screen is opened and included data in all fields
#
#  # 'Locks Historical Tree' tab , The Lock Wait (Average Active Sessions) chart is presented on both baseline and breakdown modes
#    And I click 'Locks Historical Tree' tab
#    Then 'Lock Wait (Average Active Sessions)' chart title is displayed
#
#    And I click 'Breakdown' link
#    And I click 'Baseline' link
#
#  # Click on the link at the upper-left corner of 'Locks Exceeding 90 seconds' chart and change the 'Longest duration' to Number of Locks option. Verify that the data is presented in the chart
#    And I click 'Longest duration' link
#    And I click 'Number of Locks' link
#    And 'Select a bar in the chart to view its associated snapshots.' message is displayed
## Click on 'Displaying snapshots' grid. Verify that the 'Lock Tree for Selected Snapshot' is opened

