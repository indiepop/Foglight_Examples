Feature: Storage - Redo and Archive Performance
  As an administrator role

  @mark @Smoke
  Scenario: Storage - Redo and Archive Performance
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'storage_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'Redo and Archive Performance' link in '[unnamed]' popup
    Then 'Redo and Archive Performance' message should be displayed
#    Then 'Redo and Archive Performance' grid should not contain 'n/a'
    And 'Total Redo Wait (Average Active Sessions)' message should be displayed
    When I click 'Log Switches' tab
    Then 'Number of Switches' chart should be displayed
    And 'Log Switches Latency' chart should be displayed

