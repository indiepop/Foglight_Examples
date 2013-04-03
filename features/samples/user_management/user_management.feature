Feature: User Management
  In order to ensure the user management works good
  As a tester
  I want to add, modify, search and delete user

  @ryan
  Scenario: Adding a user
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    When I click 'Manage Users, Groups, Roles' link
    And I click 'New User' button
    And I fill 'New User' dialog with next values:
      | Name | Ryan |
    And I click 'Next' button
    And I check rows on 'New User' grid which contain next values:
      | Group Names          |
      | Cartridge Developers |
      | Foglight Operators   |
    And I click 'Next' button
    And I fill 'New User' dialog with next values:
      | Password                                 | Sql!2fun |
      | Confirm Password                         | Sql!2fun |
      | Change Password at the next logon[right] | off      |
    And I click 'Next' button
    And wait 1 seconds
    And I click 'Next' button
    And I click 'Default Time Range' cell in rows in 'New User' grid which contain next values:
      | Default Time Range |
      | Last 8 Hours       |
    And I click 'Next' button
    And I fill 'New User' dialog with next values:
      | Seconds[right] | 500 |
    And I click 'Finish' button
    Then 'Make User Progress' dialog should be displayed
    And 'Users Saved' message should be displayed
    And I close 'Make User Progress' dialog
    And 'User Management' screen grid should contain next rows:
      | Name | Groups                                   | Roles                                       | Type     |
      | Ryan | Foglight Operators, Cartridge Developers | Operator, Cartridge Developer, Console User | Internal |

  @dev
  Scenario: Delete a user
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    And I click 'Manage Users, Groups, Roles' link
    And 'User Management' screen grid should contain next rows:
      | Name | Groups                                   | Roles                                       | Type     |
      | Ryan | Foglight Operators, Cartridge Developers | Operator, Cartridge Developer, Console User | Internal |
    When I check rows on 'New User' grid which contain next values:
      | Name |
      | Ryan |
    And  I click 'Remove Users' button
    Then 'Delete Objects' dialog should be displayed
    When I click 'Delete' button
    Then 'User Management' screen grid should not contain next rows:
      | Name | Groups                                  | Roles                                       | Type     |
      | Ryan | Foglight Operators, Cartridge Developers | Operator, Cartridge Developer, Console User | Internal |