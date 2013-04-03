Feature: Configuration -> Initialization Parameters
  As an administrator role

  @mark
  Scenario: Configuration - Initialization Parameters
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'configuration_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'Initialization Parameters' link in '[unnamed]' popup
    Then 'Initialization Parameters' message should be displayed
#    And 'Initialization Parameters' grid should not contain 'n/a'


