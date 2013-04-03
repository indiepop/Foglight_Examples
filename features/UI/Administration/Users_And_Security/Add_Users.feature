Feature: Increase user
  In order to ensure the user management works good
  As a tester
  I want to add user

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed
    When I click 'Manage Users, Groups, Roles' link
    Then 'User Management' message should be displayed
    When I click 'New User' button
    Then 'New User' dialog should be displayed

  @yammy @ui
  Scenario Outline: Adding user on User Management dashboard
    When I fill 'New User' dialog with next values:
      | Name | <name> |
    And I click 'Next' button
    And I check rows on 'New User' grid which contain next values:
      | Group Names          |
      | Cartridge Developers |
      | Foglight Operators   |
    And I click 'Next' button
    And I fill 'New User' dialog with next values:
      | Password                                 | Asdfgh!1 |
      | Confirm Password                         | Asdfgh!1 |
      | Change Password at the next logon[right] | off      |
    And I click 'Next' button
    Then 'Select Home Page (Optional)' message should be displayed

    When I click 'Next' button
    And I click 'Default Time Range' cell in rows in 'New User' grid which contain next values:
      | Default Time Range |
      | Last 8 Hours       |
    And I click 'Next' button
    And I fill 'New User' dialog with next values:
      | Seconds[right] | 500 |
    And I click 'Finish' button
    Then 'Make User Progress' dialog should be displayed

    When 'Users Saved' message should be displayed
    And I click 'Ok' button on 'Make User Progress' dialog
    And 'User Management' screen grid should contain next rows:
      | Name   | Groups                                   | Roles                                       | Type     |
      | <name> | Foglight Operators, Cartridge Developers | Operator, Cartridge Developer, Console User | Internal |

  Examples:
    | name    |
    | Yammy   |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |

  @yammy @ui
  Scenario: Adding user with distinguishing lowercase and upcase
    When I fill 'New User' dialog with next values:
      | Name | yammy |
    And I click 'Next' button
    Then 'Validation Result' dialog should be displayed
    And 'User already exists in the system.' message should be displayed

    When I click 'OK' button
    And I close 'New User' dialog

 @yammy @ui
  Scenario: Adding user with empty name
    When I click 'Next' button
    Then 'Validation Result' dialog should be displayed
    And 'User Name cannot be empty.' message should be displayed

    When I click 'OK' button
    And I close 'New User' dialog


