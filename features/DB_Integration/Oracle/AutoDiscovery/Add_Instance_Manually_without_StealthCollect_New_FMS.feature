Feature: Auto Discovery for  new FMS / FMS with no instances + Add instances manually + No RAC + No default credentials + No StealthCollect
  As a  administrator role

  @mark
  Scenario:  Auto Discovery when No StealthCollect and Add Instance Manually
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed in 400 seconds
    And 'All' message should be displayed in 'Databases' screen
    When I click 'AutoDiscovery_Link.png' icon
    Then 'Select the requested configuration operation' message should be displayed
    And I click 'Next' button
    And I select 'yammy_win2k364' in 'Select the Agent Manager to be used for monitoring the database instances specified in the following screens' field
    And I click 'Next' button
    Then 'Specify the requested method for adding Oracle instances or RACs' message should be displayed
    And I click 'Next' button
    And I click 'Set credentials' button
    And I fill 'Set Default Login Credentials' dialog with next values:
      | Oracle user:               | system                  |
      | Oracle password:           | Rdis3fun                |
      | OS user (domain\username): | DATABASES\Administrator |
      | OS password:               | Rdis2fun                |
    And I click 'Apply' button
    And I click 'Add instance' link
    Then 'Add a New Instance' dialog should be displayed
    When I fill 'Add a New Instance' dialog with next values:
      | Host:     | 10.30.149.160 |
      | Instance: | ORCL          |
    And I click 'OK' button
    And I check rows on 'Database Discovery Wizard on: yammy_win2k364' screen grid which contain next values:
      | Name |
      | ORCL |
    And wait 3 seconds
    And I click 'Validate connectivity' button
    Then 'Connection Verified' message should be displayed in 100 seconds
    Then 'Database Discovery Wizard on: yammy_win2k364' screen grid should contain next rows:
      | Status              |
      | Connection Verified |
    And  I click 'Monitor' button
    Then 'Creating agents' dialog should be displayed
    And 'Creating new agents to monitor the selected instances' message should be disappear in 600 seconds
    Then 'Database Discovery Wizard on: yammy_win2k364' screen grid should contain next rows:
      | Host         | Status    |
      | 10.30.149.39 | Monitored |
    And I click 'Finish' button
    Then 'Databases' screen should be displayed

