Feature: Create a One-Time blackout on Blackouts Dashboard
  In order to make sure whether add a One-Time Blackout successed
  As a Administration
  I want to create a One-Time Blackout

  Background: The same operation
    Given opened 'Dashboards -> Administration -> Setup & Support -> Blackouts' screen using default credentials
    Then 'Blackouts' screen should be displayed
    When I click 'Create a One-Time Blackout' link
    Then 'Create Blackout Wizard' screen should be displayed

  @yammy @ui

  Scenario: Adding a One-Time Blackout with suspend data collection on Blackouts Dashboard
    When I click on the 1st radio after 'What Type of Activity Would You Like to Suspend?' text
    And I click 'Next' button
    Then 'Suspend Alarms: Choose Target Type' message should be displayed

    When I click on the 2nd radio after 'Suspend Alarms: Choose Target Type' text
    And I click 'Next' button
    Then 'Suspend Alarms: Choose Blackout Targets' message should be displayed
    When I refresh the browser
    And wait 10 seconds

    When I check rows on 'Create Blackout Wizard' screen grid which contain next values:
      | Name         |
      | #agent_host# |
    And I click 'Next' button
    Then 'Specify Blackout Period' message should be displayed

    When I click on the 3rd radio after 'Specify Blackout Period' text
    And I click 'Next' button
    Then 'Select One-Time Blackout Duration' message should be displayed

    When I click 'Next' button
    Then 'Configure Name and Reason' message should be displayed

    When I type 'test' into 2nd input
    And I type 'This is test' into textarea
    And I click 'Finish' button
    Then 'New Blackout Summary: test' message should be displayed

  @yammy @ui

  Scenario: Adding a One-Time Blackout with suspend alarms on Blackouts Dashboard
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
    Then 'Specify Blackout Period' message should be displayed

    When I click on the 2nd radio after 'Specify Blackout Period' text
    And I click 'Next' button
    Then 'Configure Name and Reason' message should be displayed

    When I type 'test2' into 2nd input
    And I type 'This is test' into textarea
    And I click 'Finish' button
    Then 'New Blackout Summary: test2' message should be displayed

  #test with the issue:FGLUI-11026
  @yammy @ui

  Scenario: Adding a One-Time Blackout with suspend data collection with services
    When I click on the 1st radio after 'What Type of Activity Would You Like to Suspend?' text
    And I click 'Next' button
    Then 'Suspend Alarms: Choose Target Type' message should be displayed

    When I click on the 1st radio after 'Suspend Alarms: Choose Target Type' text
    And I click 'Next' button
    Then 'Suspend Alarms: Choose Blackout Targets' message should be displayed

    When I check rows on 'Create Blackout Wizard' screen grid which contain next values:
      | Name           |
      | Infrastructure |
    And I navigate 'Infrastructure -> AIX' in 'Create Blackout Wizard' screen tree grid
    Then Rows in the 1st grid in 'Create Blackout Wizard' screen should be select which contain next values:
      |            | Name           |
      | [selected] | Infrastructure |
    Then Rows in the 1st grid in 'Create Blackout Wizard' screen should not be select which contain next values:
      |              | Name    |
      | [unselected] | AIX     |
      | [unselected] | HP-UX   |
      | [unselected] | Linux   |
      | [unselected] | Solaris |
      | [unselected] | VMWare  |
      | [unselected] | Windows |

    And wait 5 seconds
    And I click 'Next' button
    Then 'Specify Blackout Period' message should be displayed

    When I click on the 3rd radio after 'Specify Blackout Period' text
    And I click 'Next' button
    Then 'Select One-Time Blackout Duration' message should be displayed

    When I click 'Next' button
    Then 'Configure Name and Reason' message should be displayed

    When I type 'test11' into 2nd input
    And I type 'This is test11' into textarea
    And I click 'Finish' button
    Then 'New Blackout Summary: test' message should be displayed
