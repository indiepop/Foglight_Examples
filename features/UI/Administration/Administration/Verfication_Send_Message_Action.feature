Feature: Send message on Administration Dashboard
  In order to make sure the action shows up in action panel when access the following dashboards
  As a tester
  I want to send message

  @yammy @ui @regression
  Scenario Outline: Send message
    Given opened 'Dashboards -> Administration -> Administration' screen using default credentials
    Then 'Administration' screen should be displayed

    When I click 'Send Message' link
    Then 'Send Message to All Users' dialog should be displayed

    When I fill 'Send Message to All Users' dialog with next values:
      | Subject | <Subject>    |
      | Message | This is test |
    And I select '<time>' in 'Expires in' field
    And I select '<message>' in 'Message Level' field
    And I click 'Send' button

    When I click 'unnamed' message button
    Then '<Subject>' message should be displayed in 120 seconds
#    And machine 'FMS' should not contain ERROR,FATAL in log

  Examples:
    | Subject | time       | message |
    | test1   | 5 Minutes  | Info    |
    | test2   | 15 Minutes | Warning |
    | test3   | 30 Minutes | Error   |
    | test4   | 1 Hour     | Info    |
    | test5   | 24 Hours   | Warning |

  @yammy @ui @regression
  Scenario: Check message box
    Given opened 'Dashboards -> Administration -> Administration' screen using default credentials
    Then 'Administration' screen should be displayed

    When I click 'unnamed' message button
    Then 'test1' message should be displayed

    When I click 'Clear All' button
    Then message area should not be contain message

    When I click 'Close' button
    And wait 3 seconds
    Then message area should not be displayed