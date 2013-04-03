Feature: Test new user password
  In order to ensure the user management works good
  As a tester
  I want to add new user

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed
    When I click 'Manage Users, Groups, Roles' link
    Then 'User Management' message should be displayed


  @yammy @ui
  Scenario Outline: Test new user password with eight number
    When I click 'New User' button
    And I fill 'New User' dialog with next values:
      | Name | TestPassword |
    And I click 'Next' button
    And I check rows on 'New User' grid which contain next values:
      | Group Names          |
      | Cartridge Developers |
      | Foglight Operators   |
    And I click 'Next' button

    And I fill 'New User' dialog with next values:
      | Password                                 | <pwd> |
      | Confirm Password                         | <pwd> |

    And  I click 'Next' button
    Then 'Validation Result' dialog should be displayed
    And 'The password must contain both alpha and numeric characters.' message should be displayed

  Examples:
    | pwd   |
    |12345678|
    |abcdefgh|
    |!!!!!!!!|
    |~!!~!!~~|
