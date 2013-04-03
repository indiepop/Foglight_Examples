Feature: Auto Discovery for  new FMS / FMS with no instances + Add instances manually + No RAC + No default credentials + No StealthCollect
  As a  administrator role

  @mark
  Scenario: Auto Discovery when No StealthCollect and Add Instance Manually
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I click 'Oracle_intro.png' icon
    Then 'Select the requested configuration operation' message should be displayed
  # 'Specify Operation' and 'Agent Manager' Steps
    And I click 'Next' button
    And I select 'yammy_win2k364' in 'Select the Agent Manager to be used for monitoring the database instances specified in the following screens' field
    And I click 'Next' button
    And wait 3 seconds
    Then 'Specify the requested method for adding Oracle instances or RACs' message should be displayed in 400 seconds

  #  When I click 'Add instances or Real Application Clusters manually' radio
  # 'Specify discovery method' Steps
    And I click 'Next' button
    And wait 1 seconds
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
      | Host:     | Databases |
      | Instance: | ORCL      |
    And I click 'OK' button
    And I check rows on 'Database Discovery Wizard on: yammy_win2k364' screen grid which contain next values:
      | Host      |
      | Databases |
    And wait 3 seconds
    And  I click 'Monitor' button
    Then 'Creating agents' dialog should be displayed
    And 'Creating new agents to monitor the selected instances' message should be disappear in 600 seconds
    Then 'Database Discovery Wizard on: yammy_win2k364' screen grid should contain next rows:
      | Host      | Status    |
      | Databases | Monitored |
    And wait 10 seconds
    When I click 'Finish' button
    Then 'Databases' screen should be displayed
