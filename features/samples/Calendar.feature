Feature: Sample for using calendar
  Background: popup calendar
    Given opened 'Dashboards -> Administration -> Schedules -> Manage Schedules' screen using default credentials
    Then 'Manage Schedules' screen should be displayed
    When I click 'Add' button
    Then 'Create Schedule' dialog should be displayed
    When I click 'Start:' calendar
    Then '[unnamed]' popup should be displayed

  Scenario: legal data
    When I select '2018-08-12' in calendar
    And wait 10 seconds

  Scenario: not legal month
    When I select '2020-13-12' in calendar

  Scenario: not legal month
    When I select '1999-00-12' in calendar

  Scenario: not legal day
    When I select '1999-06-32' in calendar

  Scenario: not legal day
    When I select '2013-02-29' in calendar


