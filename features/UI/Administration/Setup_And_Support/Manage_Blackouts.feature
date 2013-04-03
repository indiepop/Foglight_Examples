Feature: Manage blackout on Blackouts Dashboard
  In order to manage blackout
  As a Administration
  I want to do some execute

  Background: Go to the Blackouts screen
    Given opened 'Dashboards -> Administration -> Setup & Support -> Blackouts' screen using default credentials
    Then 'Blackouts' screen should be displayed
    When I click 'Manage Blackouts' link
    Then 'Manage Blackouts' screen should be displayed

  @yammy @ui

  Scenario: Remove a blackout on Blackouts Dashboard
    When I check rows on 'Manage Blackouts' screen grid which contain next values:
      | Name     |
      | alarm_s1 |
    And I click 'Remove Selected' button
    Then 'Delete Current Objects Confirmation' dialog should be displayed

    When I click 'Confirm' button on 'Delete Current Objects Confirmation' dialog
    Then 'Manage Blackouts' screen grid should not contain next rows:
      | alarm_s1 |

  @yammy @ui

  @todo
  Scenario: Edit a blackout on Blackouts Dashboard
    When I click 'alarm_s2' link
    Then 'Details for alarm_s2' message should be displayed
#
#    When I click 'Change' button
#    Then 'Edit Name and Reason' dialog should be displayed
#
#    When I fill 'Edit Name and Reason' dialog with next values:
#      | Name | Change |
#    And I type 'change text' into textarea
#    And I click 'Apply' button
#    And wait 5 seconds
#    And I refresh the browser
#    And wait 5 seconds
#    Then 'Details for Change' message should be displayed
#
#    When I click 'Edit' button
#    Then 'Change Schedule' dialog should be displayed
#
#    When I click 'Name' cell in rows on 'Change Schedule' dialog grid which contain next values:
#      | Name   |
#      | Always |
#    And I click 'Apply' button on 'Change Schedule' dialog
#    Then 'Schedule Information' panel grid should not contain next rows:
#      | Always |
#
#    When I click 'Remove' button
#    Then 'Select Items to Remove' dialog should be displayed
#
#    When I check rows on 'Select Items to Remove' dialog grid which contain next values:
#      | name             |
#      | Windows_IC_Agent |
#    And I click 'Remove Selected' button
#    Then 'Blacked Out Agents' panel grid should not contain next rows:
#      | Windows_IC_Agent |
#
#    When I click 'Add' button
#    Then 'Add Agents to Blackout' dialog should be displayed
#    When I click on the 1st radio after 'Select Method for Finding Agents to Add' text
#    And I click 'Next' button
#    Then 'Select agents to add to the blackout.' message should be displayed
#
#    When I click 'Name' cell in rows on 'Add Agents to Blackout' dialog grid which contain next values:
#      | Name             |
#      | Windows_IC_Agent |
#    And I click 'Finish' button
#    And wait 5 seconds
#    And I refresh the browser
#    And wait 5 seconds
#    Then 'Blacked Out Agents' panel grid should contain next rows:
#      | Name             |
#      | Windows_IC_Agent |
