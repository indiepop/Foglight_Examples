Feature: IO -> IO
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario: IO -> IO
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click "Home" button of current selected row in gird on 'Database' screen
  #  I/O -> I/O  Click on 'I/O' icon on the toolbar, click on 'I/O' option,Data is seen under 'I/O' Pane
    And I click "I/O" button
    And I click 'I/O' link
    Then 'I/O' panel should be displayed
    And 'Total IO Wait' chart should be displayed

  # Go over all the tabs (Overview, Logical I/O, Physical I/O, Operations
  # Data is seen under all tabs, both in the grids and charts
  # The charts are presented on both baseline and breakdown modes

    And I click 'Logical I/O' tab
    Then 'Logical Reads' panel should not show 'n/a'
    And 'Session Logical Reads' chart should is displayed
    And 'Total Changes' chart should is displayed

    And I click 'Physical I/O' tab
    Then 'Logical Reads' panel should not show 'n/a'
    And 'Total Physical Reads' chart should is displayed
    And 'Total Physical Writes' chart should is displayed

    And I click 'Operations' tab
    Then 'Table Fetches' panel should not show 'n/a'
    And 'Table Fetches' chart should is displayed
    And 'Total Sorts' chart should is displayed

    And I click 'Overview' tab
    Then 'Logical I/O' panel should not show 'n/a'
    And 'Physical I/O' panel should not show 'n/a'
    And 'Performance' panel should not show 'n/a'


  2. The charts are presented on both baseline and breakdown modes

  3. For each chart - there are measures and legend, and data is displayed within the chart's limits

  4. In case there are several views for a chart (you'll see an arrow next to the chart's headline)- change the view (by clicking the arrow and selecting another option) and verify data is seen
