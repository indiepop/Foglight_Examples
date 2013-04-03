Feature: Activity -> User-defined Collections
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario:  Activity - User-defined Collections
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click "Home" button of current selected row in gird on 'Database' screen
    Then 'ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102' screen should be displayed
  # Click on Activity icon on the toolbar,click on 'User-defined Collections' option
    And I click "Activity" button
    And I click 'User-defined Collections' link

  # Data is seen under 'User-defined Collections' Pane
  # If there are no 'User-defined Collections'  "No user-defined collections were added to this agent.
    Then 'No user-defined collections were added to this agent' message is displayed
  # To add one or more user-defined collections, go to the global administration User-defined Collections screen."
  # Press on "global administration User-defined Collections" link -> Press Add -> Choose the agent -> Press for Edit Credentials -> Press to Set Details -> Fill in name, description and SQL query text -> Press on any row -> Press Set -> Press OK -> Press Save Changes
    And I click 'global administration User-defined Collections' link
    Then 'Global Administration' screen should be displayed
    And I click 'Add' button
    And I click 'DBO-ZHUVMSTAORA1OG2.prod.quest.corp-ORA102' checkbox
    And I click 'Edit Credentials' button
    And I fill 'Edit Credentials for User-defined Collections' popup box with next values:
      | Collection performed using: | Dedicated credentials |
      | User:                       | sqlexp                |
      | Password:                   | sqlexp                |
    And I click 'Add' button
    And  I click 'Set Details' button
    And I fill 'Set Collection Details' popup box with next values:
      | Collection name        | hello world        |
      | Collection description | hellow world       |
      | SQL query text         | select * from dual |
    And I click 'Verify' button
    And I click 'Close' button
    And I click 'OK' button
    And I click 'Save changes' button
  #  Go back 'User-defined Collections' (or If there is at least one 'User-defined Collections')  Left side: Collections
    And opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I click "Activity" button
    And I click 'User-defined Collections' link
  #  Grid with relevant data appears
    Then 'hello world' message is displayed





