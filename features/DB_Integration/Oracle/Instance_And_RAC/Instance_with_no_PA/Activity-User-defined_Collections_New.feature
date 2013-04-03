Feature: Activity -> User-defined Collections
  As a  administrator role

  @mark @TODO
  Scenario:  Activity - Add a new User-defined Collections
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
  #    And I click 'ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
  #    Then '10.30.149.39-ORCL' screen should be displayed
    When I click 'activity.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'User-defined Collections' link in '[unnamed]' popup
    Then 'No user-defined collections were added to this agent' message should be displayed
    When I click 'global administration User-defined Collections' link
    Then 'Global Administration' screen should be displayed
#    When I click 'Add' button
#    Then 'User-defined Collections Not Enabled' dialog should be displayed
#    When I check rows on 'User-defined Collections Not Enabled' dialog grid which contain next values:
#      | Agent              |
#      | DBO-DATABASES-ORCL |
#    And wait 2 seconds
#    And I click 'Edit Credentials' button
#    And I fill 'Edit Credentials for User-defined Collections' dialog with next values:
#      | Collection performed using: | Dedicated credentials |
#      | User:                       | Rdis2fun              |
#      | Password:                   | Rdis2fun              |
    And I click 'Add' button
    Then 'Add a User-defined Collection' dialog should be displayed
    When  I click 'Set Details' button
    And I fill 'Set Collection Details' dialog with next values:
      | Collection name        | hello world        |
      | Collection description | hello world        |
      | SQL query text         | select * from dual |
    And I click 'Verify' button
    Then 'Verification Results' dialog should be displayed
    And I click 'Close' button
    And I click 'OK' button
    And I click 'Save changes' button
#   Go back 'User-defined Collections' (or If there is at least one 'User-defined Collections')  Left side: Collections
#    And opened 'Dashboards -> Databases -> Databases' screen using default credentials
#    And I click "Activity" button
#    And I click 'User-defined Collections' link
#  #  Grid with relevant data appears
#    Then 'hello world' message is displayed





