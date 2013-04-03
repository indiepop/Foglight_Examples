Feature: Storage - Invalid Objects
  As an administrator role

  @mark @Smoke
  Scenario: Storage - Invalid Objects
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'storage_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'Invalid Objects' link in '[unnamed]' popup
    And 'Invalid Objects Table' message should be displayed
