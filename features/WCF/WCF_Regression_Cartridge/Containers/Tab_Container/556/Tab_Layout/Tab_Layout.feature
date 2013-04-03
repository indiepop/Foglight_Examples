Feature: Automation for Containers -> Tab Layout

  @jacin @wcf
  Scenario: Test Tab Layout
    Given opened 'Dashboards->WCF Regression->Containers->Tab Container->556->Tab Layout->Tab Layout' screen using default credentials
    Then 'Tab Layout' screen should be displayed

    When I click 'System Resources for' link
    Then 'Tab Layout' screen grid should contain 'CPU'
    And 'Tab Layout' screen grid should contain 'Memory'
    And 'Tab Layout' screen grid should contain 'Disks'

    When I click 'Monitored Hosts Only' link
    Then I select 'All Hosts' in 'Filter By Activity:' field

    When I type 'yammy_win2k364' into 2st input
    And I click the 'Search' button
    Then 'Tab Layout' screen grid should contain 1 rows

    Then I click 'CPU and Memory Performance' link
    And wait 3 seconds
    

