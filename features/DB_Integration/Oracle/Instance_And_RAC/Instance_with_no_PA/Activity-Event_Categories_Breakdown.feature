Feature: Activity -> Event Categories Breakdown
  As an administrator role

  @mark @TODO
  Scenario: Activity - Event Categories Breakdown
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    Then '10.30.149.39-ORCL' screen should be displayed
    When I click 'activity.png' icon
    Then '[unnamed]' popup should be displayed
    And I click 'Event Categories Breakdown' link in '[unnamed]' popup
    Then 'Event Categories Breakdown' message should be displayed
  # Click on the title Wait Categories for Selected Periods, A popup that allows choosing between the following options: Current wait time and Period wait time appears
#    When I click 'Wait Categories for Selected Period' link
#    And I click 'Period' link
#    And wait 1 seconds
#    And I click 'All wait events…' link
#    Then '[unnamed]' dialog grid should not contain 'n/a'




