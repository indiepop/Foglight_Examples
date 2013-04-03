Feature: Installation with some instances + Import instances by tnsnames.ora file +RAC+Set default credentials+StealthCollect
  As a  administrator role

  @In_progress
  Scenario: RAC
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click 'AutoDiscovery_Link.png' icon
    And I click 'Next' button
    And I select 'mark-win2k3' in 'Select the Agent Manager to be used for monitoring the database instances specified in the following screens' field
    And I click 'Next' button
    And wait 3 seconds
    Then 'Specify the requested method for adding Oracle instances or RACs' message should be displayed
  #    When I click on the 1st radio after 'Specify Discovery Method' text
    When I click 'radio_unselected.png' icon
    And wait 1 seconds
    And I click 'Click to select a file' link
    Then 'Select a File to Import' dialog should be displayed
    When I upload file "D:\File\tnsnames.ora" in 'Select a File to Import' dialog
    And I click 'OK' button in 'Select a File to Import' dialog
    Then 'tnsnames.ora' message should be displayed
    And I click 'Next' button
    And wait 10 seconds
    And I click 'Select all' button
    And wait 3 seconds
    And I click 'Validate connectivity' button
    And wait 30 seconds
    Then 'Database Discovery Wizard on: mark-win2k3' screen grid should contain next rows:
      | Status                                    |
      | Insufficient DB Privileges,Click to grant |
#    Then 'Database Discovery Wizard on: zhu13703' screen should contain following items:
#      | Status                                    |
#      | Insufficient DB Privileges,Click to grant |
#
#  Scenario: 'Instance Connectivity Settings' Step
#    And I click 'Grant DB privileges' button
#    And I fill 'Grant Database Privileges' popup box with next values:
#      | SYSDBA user     | sys    |
#      | SYSDBA password | sqlexp |
#    And I click 'Grant DB privileges' button in 'Grant Database Privileges' popup box
#    And wait 30 seconds
#    And  I click 'Monitor' button
#    And  I click 'Finish' button

