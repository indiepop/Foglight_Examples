Feature: IO -> IO
  As an administrator role

  @mark @TODO
  Scenario: I/O - I/O
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'IO_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'I/O' link in '[unnamed]' popup
    Then 'I/O' screen should be displayed
    When I click 'Logical I/O' tab
    Then 'Logical Reads' grid should be displayed
    And 'Session Logical Reads' chart should be displayed
    And 'Logical Reads' grid should not contain 'n/a'
  #    When I click 'Breakdown' link in 'Logical Reads' grid
    And 'Session Logical Reads' grid should not contain 'n/a'
    And 'Block Changes' grid should be displayed
  #    And 'Total Changes' chart should be displayed
  #    And I click 'Breakdown' link
  #    And 'Total Changes' chart should be displayed
  #    And 'Read Consistency Overhead' grid should be displayed
    And I click 'Physical I/O' tab
    And 'Physical Reads' grid should be displayed
  #    When I click 'Breakdown' link in 'Physical Reads' grid
    Then 'Total Physical Reads' chart should be displayed
    And 'Physical Reads' grid should not contain 'n/a'

    And 'Physical Writes' grid should be displayed
  #    When I click 'Breakdown' link in 'Physical Writes' grid
  #    Then 'Total Physical Writes' chart should be displayed
    And 'Physical Writes' grid should not contain 'n/a'

    When I click 'Operations' tab
    Then 'Table Fetches' grid should be displayed
    And 'Table Fetches' grid should not contain 'n/a'
    And 'Disk Sorts' grid should be displayed
    And 'Disk Sorts' grid should not contain 'n/a'
#    And I click 'Breakdown' link
#    And 'Total Sorts' chart should be displayed
