Feature: IO -> IO
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario: IO -> IO
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click 'Home Page' button
    And I click 'I/O' button
    And I click 'I/O' link
    Then 'I/O' panel should be displayed

#    Go over all the tabs (Overview, Logical I/O, Physical I/O, Operations
#    1. Data is seen under all tabs, both in the grids and charts
#    2. The charts are presented on both baseline and breakdown modes
#    3. For each chart - there are measures and legend, and data is displayed within the chart's limits
#    4. In case there are several views for a chart (you'll see an arrow next to the chart's headline)- change the view (by clicking the arrow and selecting another option) and verify data is seen

    And I click 'Overview' tab
    Then 'Logical I/O' panel should be displayed
    And 'Physical I/O' panel should be displayed
    And 'Performance' panel should be displayed

    And I click 'Logical I/O' tab
    Then 'Logical Reads' panel should be displayed
    And 'Session Logical Reads' gird should not contain 'n/a'
    And I click 'Baseline' link
    And 'Session Logical Reads' gird should not contain 'n/a'
    And 'Block Changes' panel should be displayed
    And 'Total changes' panel should be displayed
    And I click 'Breakdown' link
    And 'Total changes' chart should be displayed
    And 'Read Consistency Overhead' panel should be displayed

    And I click 'Physical I/O' tab
    And 'Physical Reads' panel should be displayed
    And I click 'Breakdown' link
    And 'Total Physical Reads' panel should be displayed
    And 'Physical Writes' panel should be displayed
    And I click 'Breakdown' link
    And 'Total Physical Writes' panel should be displayed


    And I click 'Operations' tab
    And 'Table Fetches' panel should be displayed
    And 'Disk Sorts' panel should be displayed
    And I click 'Breakdown' link
    And 'Total Sorts' panel should be displayed


