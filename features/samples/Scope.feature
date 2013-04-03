@lane @dev
Feature:
  In order to test the scope step
  As a component developer
  I want make sure the scope works properly

  @scope
  Scenario: Test Scope
    Given opened 'Dashboards->My Dashboards->T3 Layout' screen using default credentials
    Then 'T3 Layout' screen should be displayed
    Then 'T3' panel should be displayed in 5 seconds in 'T3 Layout' screen
    Then 'T3' panel should be displayed in 'T3 Layout' screen
    Then 'T3' panel should be displayed in 5 seconds

    And I click 'Click' button in 3rd 'T1' table in 2nd 'T2' table on 1st panel

    Then 'popuplabel02' dialog should be displayed in 5 seconds
    And 'This is three' message should be displayed
    And I close 'popuplabel02' dialog

#    When I click 'Click' button in 2nd 'T1' table
#
#    Then 'popuplabel01' dialog should be displayed
#    And 'This is two' message should be displayed
#    And I close 'popuplabel01' dialog
#
#    When I click 'Host Selector' link in 'T1' table
#
#    Then 'Host Selector' dialog should be displayed
#    And I close 'Host Selector' dialog
#
#    When I click 'Host Selector' link in table
#
#    Then 'Host Selector' dialog should be displayed
#    And I close 'Host Selector' dialog
#
#    When I click the 2nd 'Click' button
#
#    Then 'popuplabel02' dialog should be displayed
#    And 'This is three' message should be displayed
#    And I close 'popuplabel02' dialog