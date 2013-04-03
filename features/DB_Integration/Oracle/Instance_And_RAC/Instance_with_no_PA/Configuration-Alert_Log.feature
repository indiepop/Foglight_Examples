Feature: Configuration - Alert Log
  As an administrator role

  @Regression @Smoke @flora
  Scenario: Configuration - Alert Log
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'configuration_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'Alert Log' link in '[unnamed]' popup
    Then 'Alert Log Messages' message should be displayed





