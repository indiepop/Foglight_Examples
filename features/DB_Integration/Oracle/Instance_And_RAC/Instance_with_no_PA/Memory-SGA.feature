Feature: Memory - SGA
  As an administrator role

  @mark
  Scenario: Memory - SGA
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'memory_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'SGA' link in '[unnamed]' popup
    Then 'Automatic SGA: ON' message should be displayed
    And 'SGA Size' grid should be displayed
    And 'Free Space' grid should be displayed


