Feature: Storage - Redo Logs
  As an administrator role

  @mark @TODO
  Scenario: Storage - Redo Logs
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'storage_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'Archive Logs' link in '[unnamed]' popup
    Then 'Archive Logs' message should be displayed