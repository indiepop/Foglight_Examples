Feature: Agent Managers
  In order to make sure whether this function work fine
  As a Administration
  I want to deploy and undeploy agent package,create agent

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Agents -> Agent Managers' screen using default credentials
    Then 'Agent Managers' screen should be displayed

  @yammy @ui

  Scenario: Deploy agent package
    When I check rows on 'Agent Managers' screen grid which contain next values:
      | Host Name    |
      | #agent_host# |
    And wait 5 seconds
    And I click 'Deploy Agent Package' button
    Then 'Deploy Agent Package' dialog should be displayed

    When I check rows on 'Deploy Agent Package' dialog grid which contain next values:
      | Package     |
      | Host Agents |
    And wait 3 seconds
    And I click 'Next' button in 'Deploy Agent Package' dialog
    Then 'Summary' message should be displayed

    When I click 'Finish' button
    Then 'Deploy Agent Package' dialog should be disappear in 100 seconds

    And wait 30 seconds
    When I click 'Refresh' button
    And the 2rd grid should contain next rows in 60 seconds:
      | Action               | Status Message       |
      | Deploy Agent Package | Task was successful. |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Undeploy agent package
    When I check rows on 'Agent Managers' screen grid which contain next values:
      | Host Name    |
      | #agent_host# |
    And wait 5 seconds
    And I click 'Undeploy Agent Package' button
    Then 'Undeploy Agent Package' dialog should be displayed

    When I check rows on 'Undeploy Agent Package' dialog grid which contain next values:
      | Package    |
      | HostAgents |
    And wait 3 seconds
    And I click 'Next' button
    And wait 3 seconds
    Then 'Summary' message should be displayed

    When I click 'Finish' button
    Then 'Undeploy Agent Package' dialog should be disappear in 100 seconds

    When I click 'Refresh' button
    And the 2rd grid should contain next rows in 60 seconds:
      | Action                 | Status Message       |
      | Undeploy Agent Package | Task was successful. |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Deploy agent package
    When I check rows on 'Agent Managers' screen grid which contain next values:
      | Host Name    |
      | #agent_host# |
    And wait 5 seconds
    And I click 'Deploy Agent Package' button
    Then 'Deploy Agent Package' dialog should be displayed

    When I check rows on 'Deploy Agent Package' dialog grid which contain next values:
      | Package     |
      | Host Agents |
    And wait 3 seconds
    And I click 'Next' button in 'Deploy Agent Package' dialog
    Then 'Summary' message should be displayed

    When I click 'Finish' button
    Then 'Deploy Agent Package' dialog should be disappear in 100 seconds
    When I click 'Refresh' button
    And the 2rd grid should contain next rows in 60 seconds:
      | Action               | Status Message       |
      | Deploy Agent Package | Task was successful. |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Create agent
    When I check rows on 'Agent Managers' screen grid which contain next values:
      | Host Name    |
      | #agent_host# |
    And wait 5 seconds
    And I click 'Create Agent' button
    Then 'Create Agent' dialog should be displayed

    When I check rows on 'Create Agent' dialog grid which contain next values:
      | Agent Type   |
      | WindowsAgent |
    And I uncheck on checkbox after 'Generate Name:' text
    And wait 3 seconds
    And I fill 'Create Agent' dialog with next values:
      | Instance Name: | winICagent |
    And wait 3 seconds
    And I click 'Next' button
    Then 'Summary' message should be displayed

    When I click 'Finish' button
    Then 'Create Agent' dialog should be disappear in 100 seconds

    When I click 'Refresh' button
    And the 2rd grid should contain next rows in 60 seconds:
      | Action       | Status Message       |
      | Create Agent | Task was successful. |
#    And machine 'FMS' should not contain ERROR,FATAL in log
