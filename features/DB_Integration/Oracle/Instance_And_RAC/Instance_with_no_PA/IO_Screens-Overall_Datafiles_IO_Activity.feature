Feature: Activity -> Overall Datafiles I/O Activity With Alarm
  As an administrator role

  @mark
  Scenario: Overall Datafiles I/O Activity With Alarm
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'IO_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'Overall Datafiles I/O' link in '[unnamed]' popup
    Then 'Physical I/O Activity' grid should be displayed
    And 'Datafiles I/O Summary' grid should be displayed
