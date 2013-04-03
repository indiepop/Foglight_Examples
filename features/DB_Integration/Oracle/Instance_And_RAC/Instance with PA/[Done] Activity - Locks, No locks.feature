Feature: Activity -> Locks, No locks
  As a administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario: Activity - Locks, No locks
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I click '10.30.149.58-ORCL' link
    And I click "Home Page" button
  #  Click on 'Activity' icon on the toolbar, click on 'Locks' option, No locks
    And I click "Activity" button on toolbar
    And I click 'Locks' link
    And I click 'Locks Tree (Current)' tab
    Then 'There Is No Data To Display.' message is displayed
