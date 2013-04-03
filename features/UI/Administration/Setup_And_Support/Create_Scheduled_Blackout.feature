Feature: Create a scheduled blackout on Blackouts Dashboard
  In order to make sure whether add a scheduled Blackout successed
  As a Administration
  I want to create a scheduled Blackout

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Setup & Support -> Blackouts' screen using default credentials
    Then 'Blackouts' screen should be displayed

    When I click 'Create a Scheduled Blackout' link
    Then 'Create Blackout Wizard' screen should be displayed

  @yammy @ui
  Scenario: Adding a scheduled blackout with suspend alarms on Blackouts Dashboard
    When I click on the 1st radio after 'What Type of Activity Would You Like to Suspend?' text
    And I click 'Next' button
    And wait 5 seconds
    Then 'Suspend Alarms: Choose Target Type' message should be displayed

    When I click on the 2nd radio after 'Suspend Alarms: Choose Target Type' text
    And wait 5 seconds
    And I click 'Next' button
    Then 'Suspend Alarms: Choose Blackout Targets' message should be displayed

    When I refresh the browser
    And wait 10 seconds
    And I check rows on 'Create Blackout Wizard' screen grid which contain next values:
      | Name         |
      | #agent_host# |
    And I click 'Next' button
    Then 'Choose a Blackout Schedule' message should be displayed

    When I click 'New Schedule' button
    Then 'Simple New Schedule Wizard' dialog should be displayed

    When I click on the 3rd radio after 'Simple New Schedule Wizard' text
    Then 'Occur every' message should be displayed

    When I click 'Next' button on 'Simple New Schedule Wizard' dialog
    Then 'If this schedule never expires, check this checkbox' message should be displayed

    When I click 'Next' button on 'Simple New Schedule Wizard' dialog
    Then 'Do you have any specific time during the day when this schedule takes effect?' message should be displayed

    When I click 'Next' button on 'Simple New Schedule Wizard' dialog
    Then 'Enter the time of day the schedule is in effect:' message should be displayed

    When I click 'Next' button on 'Simple New Schedule Wizard' dialog
    Then 'Schedule Name' message should be displayed

    When I fill 'Simple New Schedule Wizard' dialog with next values:
      | Schedule Name | s1 |
    And I type 'this is schedule' into textarea
    And I click 'Finish' button on 'Simple New Schedule Wizard' dialog
    Then 's1' message should be displayed

    When I click 'Name' cell in rows on 'Create Blackout Wizard' screen grid which contain next values:
      | Name |
      | s1   |
    And I click 'Next' button
    Then 'Configure Name and Reason' message should be displayed

    When I type 'schedule' into 2nd input
    And I type 'This is test' into textarea
    And I click 'Finish' button
    Then 'New Blackout Summary: schedule' message should be displayed

  @yammy @ui
  Scenario Outline: Adding a scheduled blackout with suspend alarms on Blackouts Dashboard
    When I click on the 1st radio after 'What Type of Activity Would You Like to Suspend?' text
    And I click 'Next' button
    And wait 5 seconds
    Then 'Suspend Alarms: Choose Target Type' message should be displayed

    When I click on the 2nd radio after 'Suspend Alarms: Choose Target Type' text
    And wait 5 seconds
    And I click 'Next' button
    Then 'Suspend Alarms: Choose Blackout Targets' message should be displayed

    When I refresh the browser
    And wait 10 seconds
    And I check rows on 'Create Blackout Wizard' screen grid which contain next values:
      | Name         |
      | #agent_host# |
    And I click 'Next' button
    Then 'Choose a Blackout Schedule' message should be displayed

    When I click 'Name' cell in rows on 'Create Blackout Wizard' screen grid which contain next values:
      | Name   |
      | <Name> |
    And I click 'Next' button
    Then 'Configure Name and Reason' message should be displayed

    When I type '<title>' into 2nd input
    And I type 'This is test' into textarea
    And I click 'Finish' button
    Then 'New Blackout Summary: <title>' message should be displayed

  Examples:
    | Name                          | title     |
    | Always                        | alarm_s1  |
    | Beginning of the day          | alarm_s2  |
    | Beginning of the month        | alarm_s3  |
    | Beginning of the week         | alarm_s4  |
    | Business hours                | alarm_s5  |
    | Business week                 | alarm_s6  |
    | Create SupportBundle Schedule | alarm_s7  |
    | Daily Database Maintenance    | alarm_s8  |
    | Daily Off Hours               | alarm_s9  |
    | End of Day                    | alarm_s10 |
    | First day of month            | alarm_s11 |
    | First day of week             | alarm_s12 |
    | Frequent [Test]               | alarm_s13 |
    | Hourly                        | alarm_s14 |
    | Monthly Off Hours             | alarm_s15 |

  @yammy @ui
  Scenario Outline: Adding a scheduled blackout with suspend data collection on Blackouts Dashboard
    When I click on the 2nd radio after 'What Type of Activity Would You Like to Suspend?' text
    And I click 'Next' button
    Then 'Select Agents to Suspend Data Collection' message should be displayed

    When I click on the 1st radio after 'Select Agents to Suspend Data Collection' text
    And I click 'Next' button
    Then 'Select Agents to Black Out' message should be displayed

    When I refresh the browser
    And wait 10 seconds
    When I check rows on 'Create Blackout Wizard' screen grid which contain next values:
      | Name       |
      | winICagent |
    And I click 'Next' button
    Then 'Choose a Blackout Schedule' message should be displayed

    When I click 'Name' cell in rows on 'Create Blackout Wizard' screen grid which contain next values:
      | Name   |
      | <Name> |
    And I click 'Next' button
    Then 'Configure Name and Reason' message should be displayed

    When I type '<title>' into 2nd input
    And I type 'This is test' into textarea
    And I click 'Finish' button
    Then 'New Blackout Summary: <title>' message should be displayed

  Examples:
    | Name                          | title    |
    | Always                        | data_s1  |
    | Beginning of the day          | data_s2  |
    | Beginning of the month        | data_s3  |
    | Beginning of the week         | data_s4  |
    | Business hours                | data_s5  |
    | Business week                 | data_s6  |
    | Create SupportBundle Schedule | data_s7  |
    | Daily Database Maintenance    | data_s8  |
    | Daily Off Hours               | data_s9  |
    | End of Day                    | data_s10 |
    | First day of month            | data_s11 |
    | First day of week             | data_s12 |
    | Frequent [Test]               | data_s13 |
    | Hourly                        | data_s14 |
    | Monthly Off Hours             | data_s15 |




