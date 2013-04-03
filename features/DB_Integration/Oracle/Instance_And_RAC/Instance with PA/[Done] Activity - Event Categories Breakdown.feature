Feature: Activity -> Event Categories Breakdown
  As an administrator role

  @Regression @Smoke @flora
  Scenario: Activity - Event Categories Breakdown
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I click '10.30.149.58-ORCL' link
    And I click "Home Page" button
  #  Click on 'Activity' icon on the toolbar, click on 'Event Categories Breakdown' option
    And I click "Activity" button on toolbar
    And I click 'Event Categories Breakdown' link
  # Data is seen under 'Event Categories Breakdown' Pane
    Then 'Event Categories Breakdown' message is displayed
    And 'Workload (Average Active Sessions)' chart title is displayed
  # Click on the title Wait Categories for Selected Periods, A popup that allows choosing between the following options: Current wait time and Period wait time appears
    And I click 'Wait Categories for Selected Period' link
    And I click 'Period' link
  # Click on 'All wait events...' left-bottom corner, 'All Wait Events' popup open
    And I click 'All wait events…' link
    Then 'All Wait Events' grid should not contain 'n/a'



