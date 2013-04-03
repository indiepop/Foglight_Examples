Feature: Activity -> Tablespaces
  In case there was not alarm in 'Tablespaces Summary' grid it should be presented in the Tablespace Properties section
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario:  Activity - Tablespaces
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click "Home" button of current selected row in gird on 'Database' screen
  # Storage -> Tablespaces  Click on 'Storage' icon on the toolbar,
  # click on 'Tablespaces and Datafiles' option  Data is seen under 'Tablespaces' pane for 'Top 10 Tablespaces' and 'Tablespaces Summary'

    And I click "Storage" button
    And I click 'Tablespaces and Datafiles' link
    Then 'Tablespaces' message is displayed

  # Top 10 Tablespaces  1. Data is seen chart for 'Show top by:' Size
    And 'Show top by : Size' chart is displayed

  # Data is seen chart for 'Show top by:' % Space Usage
    And I click '% Space Usage' link
    Then '% Space Usage' chart is displayed

  # Tablespaces Summary  Data is seen in all fields of the grid
    Then 'Tablespaces Summary' panel should not show 'n/a'

  # Click on alarm link in case the alarms appear at the 'Tablespaces Summary' grid  Alarms window opens


 # Click on any Tablespace's name at 'Tablespaces Summary' grid  Tablespace Properties page for apecific tablespace is seen. In case there was alarm in 'Tablespaces Summary' grid it should be presented in the Tablespace Properties section
  Tablespace Properties page  Data is seen
  1. Tablespace Properties (upper-left) - Data is seen in grid.
  2. Space Utilization (upper-right) - Data is seen in chart.
  3. Free Space Fragmentation (right) - click on "Click here to retrieve data for the selected tablespace."
  Fragmentation should appear is the instance is not with heavy resource contention
  4. Tablespace Details (bottom) - Data is seen for both 2 tabs: Datafiles and All Metrics
  Click on any Datafiles link  Datafile Storage page for apecific datafile is seen
  Datafile Storage page  1. There are no N/A

  2. Click on the 'Analyze Fragmentation' link and verify that the data appears in the Fragmentation chart

  3. Click on the links of:
    * Containing Tablespace (SALES_PART_DATA)[Harry 10/27 ?]
    * View all tablespaces
    * View all datafiles
    * Datafile I/O Details
  - The links leads you compatible pages


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


