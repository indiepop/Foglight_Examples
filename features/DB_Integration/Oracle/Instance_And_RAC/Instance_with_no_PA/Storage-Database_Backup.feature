Feature: Storage - Database Backup
  As an administrator role

  @mark @Smoke
  Scenario: Storage - Database Backup
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'storage_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'Database Backup' link in '[unnamed]' popup
    Then 'Last Successful Backup' message should be displayed
    And 'There Is No Data To Display' message should be displayed




