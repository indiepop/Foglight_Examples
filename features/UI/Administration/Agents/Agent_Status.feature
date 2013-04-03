Feature: Agent Status
  In order to make sure whether this function work fine
  As a Administration
  I want to test

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Agents -> Agent Status' screen using default credentials
    Then 'Agent Status' screen should be displayed

  @yammy @ui

  Scenario: Deploy agent package
    When I click 'Deploy Agent Package' button
    Then 'Deploy Agent Package' dialog should be displayed

    When I check rows on 'Deploy Agent Package' dialog grid which contain next values:
      | Host Name    |
      | #agent_host# |
    And wait 5 seconds

    When I click 'Next' button in 'Deploy Agent Package' dialog
    Then 'Select the agent packages to deploy to the selected hosts.' message should be displayed

    When I check rows on 'Deploy Agent Package' dialog grid which contain next values:
      | Package     |
      | Host Agents |
    And wait 5 seconds
    And I click 'Next' button
    Then 'Summary' message should be displayed
    And wait 5 seconds

    When I click 'Finish' button
    Then 'Deploy Agent Package' dialog should be disappear in 100 seconds

    When I click 'Refresh' button
    Then the 2rd grid should contain next rows in 60 seconds:
      | Action               | Status Message       |
      | Deploy Agent Package | Task was successful. |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Create agent
    When I click 'Create Agent' button
    Then 'Create Agent' dialog should be displayed

    When I check rows on 'Create Agent' dialog grid which contain next values:
      | Host Name    |
      | #agent_host# |
    And wait 5 seconds
    And I click 'Next' button
    Then 'Agent Type and Instance Name' message should be displayed

    When I check rows on 'Create Agent' dialog grid which contain next values:
      | Agent Type   |
      | WindowsAgent |
    And I uncheck on checkbox after 'Generate Name:' text
    And wait 5 seconds
    And I fill 'Create Agent' dialog with next values:
      | Instance Name: | yammy_winagent |
    And I click 'Next' button
    Then 'Summary' message should be displayed

    When I click 'Finish' button
    Then 'Create Agent' dialog should be disappear in 100 seconds

    When I click 'Refresh' button
    Then the 2rd grid should contain next rows in 60 seconds:
      | Action       | Status Message       |
      | Create Agent | Task was successful. |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui
  Scenario: Edit properties for agent
    When I check rows on 'Agent Status' screen grid which contain next values:
      | Agent Name     |
      | yammy_winagent |
    And wait 5 seconds

    When I click 2nd 'Edit' button
    And '[unnamed]' popup should be displayed
    And I select 'Edit Properties' in '[unnamed]' popup
    Then 'Edit Properties' screen should be displayed

    When I go to 1st frame
    And wait 5 seconds
    And I click 'Modify properties for this agent only.' link
    And wait 10 seconds
    And I type '#host#' into 1st input
    And I click 'Save' button
    And I out of frame
    And I click 'Agent Status' link

    Then 'Agent Status' screen grid should contain next rows in 60 seconds:
      | Private Property       | Agent Name     |
      | [img]privateProperty16 | yammy_winagent |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui
  Scenario: Activate agent
    When I check rows on 'Agent Status' screen grid which contain next values:
      | Agent Name     |
      | yammy_winagent |
    And wait 5 seconds

    When I click 'Activate' button
    Then 'Agent Status' screen grid should contain next rows in 60 seconds:
      | Collecting Data | Agent Name     |
      | [img]start16    | yammy_winagent |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Start data collection
    When I check rows on 'Agent Status' screen grid which contain next values:
      | Agent Name     |
      | yammy_winagent |
    And wait 5 seconds

    And I click 'Start Data Collection' button
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Deactivate agent
    When I check rows on 'Agent Status' screen grid which contain next values:
      | Agent Name     |
      | yammy_winagent |
    And wait 5 seconds

    When I click 'Deactivate' button
    Then 'Deactivate Agent(s)' dialog should be displayed

    Then 'Agent Status' screen grid should contain next rows in 60 seconds:
      | Collecting Data | Agent Name     |
      | [img]stop16     | yammy_winagent |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Stop data collection
    When I check rows on 'Agent Status' screen grid which contain next values:
      | Agent Name     |
      | yammy_winagent |
    And wait 5 seconds

    When I click 'Stop Data Collection' button
    Then 'Agent Status' screen grid should contain next rows in 60 seconds:
      | Collecting Data | Agent Name     |
      | [img]stop16     | yammy_winagent |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Delete agent
    When I check rows on 'Agent Status' screen grid which contain next values:
      | Agent Name     |
      | yammy_winagent |
    And wait 5 seconds

    When I click 'Delete' button
    Then 'Delete Agent(s)' dialog should be displayed

    When I click 'OK' button
    Then 'Agent Status' screen grid should not contain next rows in 60 seconds:
      | Agent Name     |
      | yammy_winagent |
#    And machine 'FMS' should not contain ERROR,FATAL in log
