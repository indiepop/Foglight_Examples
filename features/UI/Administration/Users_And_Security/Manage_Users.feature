Feature: User Management
  In order to ensure the user management works good
  As a tester
  I want to add, edit, copy and delete user

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed
    When I click 'Manage Users, Groups, Roles' link
    Then 'User Management' message should be displayed

#  @yammy @ui
#  Scenario: Search a user
#    And wait 10 seconds
#    And I refresh the browser
#    When I type 'Yammy' into search field in 'User Management' screen
#    And wait 10 seconds
#    Then 'User Management' screen grid should contain next rows:
#      | Name  |
#      | Yammy |

  @yammy @ui
  Scenario Outline: Edit a user
    When I click 'Name' cell in rows in 'User Management' screen grid which contain next values:
      | Name   |
      | <name> |
    And I select 'Edit' in '[unnamed]' popup
    Then 'Editing user' dialog should be displayed

    When I click 'Next' button on 'Editing user' dialog
    Then 'Select groups to assign to <name>' message should be displayed
    And I check rows on 'Editing user' dialog grid which contain next values:
      | Group Names             |
      | Foglight Administrators |
    And I uncheck rows on 'Editing user' dialog grid which contain next values:
      | Group Names          |
      | Cartridge Developers |
      | Foglight Operators   |
    And I click 'Next' button
    And I fill 'Editing user' dialog with next values:
      | Password                                 | Asdfgh!2 |
      | Confirm Password                         | Asdfgh!2 |
      | Change Password at the next logon[right] | off      |
    And I click 'Next' button
    Then 'Select Home Page (Optional)' message should be displayed

    When I click 'Next' button
    And I click 'Default Time Range' cell in rows in 'Editing user' dialog grid which contain next values:
      | Default Time Range |
      | Last 4 Hours       |
    And I click 'Next' button
    And I fill 'Editing user' dialog with next values:
      | Seconds[right] | 400 |
    And I click 'Finish' button
    Then 'Make User Progress' dialog should be displayed

    When 'Users Saved' message should be displayed
    And I click 'Ok' button on 'Make User Progress' dialog
    And 'User Management' screen grid should contain next rows:
      | Name   | Groups                  |
      | <name> | Foglight Administrators |

  Examples:
    | name    |
    | Yammy   |
    | test    |
    | 1       |
#    | .yammy  |
    | 珠海虹天 |

  @yammy @ui
  Scenario: copy a user
    When I click 'Name' cell in rows in 'User Management' screen grid which contain next values:
      | Name  |
      | Yammy |
    And I select 'Copy' in '[unnamed]' popup
    Then 'Editing user' dialog should be displayed

    When I fill 'Editing user' dialog with next values:
      | Name | Copy |
    When I click 'Next' button on 'Editing user' dialog
    Then 'Select groups to assign to Copy' message should be displayed

    When I click 'Next' button on 'Editing user' dialog
    And I fill 'Editing user' dialog with next values:
      | Password                                 | Asdfgh!3 |
      | Confirm Password                         | Asdfgh!3 |
      | Change Password at the next logon[right] | off      |
    And I click 'Next' button on 'Editing user' dialog
    Then 'Select Home Page (Optional)' message should be displayed

    When I click 'Next' button on 'Editing user' dialog
    Then 'Select Default Time Range' message should be displayed

    When I click 'Next' button on 'Editing user' dialog
    Then 'Refresh Interval' message should be displayed

    When I click 'Finish' button on 'Editing user' dialog
    Then 'Make User Progress' dialog should be displayed
    And 'Users Saved' message should be displayed

    When I click 'Ok' button on 'Make User Progress' dialog
    And 'User Management' screen grid should contain next rows:
      | Name |
      | Copy |

  @yammy @ui
  Scenario: change user password
    When I click 'Name' cell in rows in 'User Management' screen grid which contain next values:
      | Name  |
      | Yammy |
    And I select 'Change Password' in '[unnamed]' popup
    Then 'Change password' dialog should be displayed

    When I fill 'Change password' dialog with next values:
      | Password                                 | Asdfgh!4 |
      | Confirm Password                         | Asdfgh!4 |
      | Change Password at the next logon[right] | off      |
    And I click 'Change' button on 'Change password' dialog
    And wait 10 seconds
    And I click 'Sign Out' link
    Then 'You have been logged out' message should be displayed

    When I type 'Yammy' in 'User' field
    And I type 'Asdfgh!49' in 'Password' field
    And I click 'Login' button

  @yammy @ui
  Scenario: Force user to change password
    When I click 'Name' cell in rows in 'User Management' screen grid which contain next values:
      | Name  |
      | Yammy |
    And I select 'Force Password Change' in '[unnamed]' popup
    Then 'Force to Change Password' dialog should be displayed

    When I click 'Change Password Next Logon' button on 'Force to Change Password' dialog
    Then 'passwordExpire16.png' icon should be displayed

  @yammy @ui
  Scenario: Delete a user
    When I check rows on 'New User' grid which contain next values:
      | Name  |
      | Yammy |
    And wait 1 seconds
    And  I click 'Remove Users' button
    Then 'Delete Objects' dialog should be displayed

    When I click 'Delete' button
    Then 'User Management' screen grid should not contain next rows:
      | Yammy | Foglight Operators, Cartridge Developers | Operator, Cartridge Developer, Console User | Internal |

  @yammy @ui
  Scenario: Delete some users
    When I check rows on 'New User' grid which contain next values:
      | Name |
      | 1    |
      | test |
      | Copy |
    And wait 1 seconds
    And  I click 'Remove Users' button
    Then 'Delete Objects' dialog should be displayed

    When I click 'Delete' button
    Then 'User Management' screen grid should not contain next rows:
      | 1    | Foglight Operators, Cartridge Developers | Operator, Cartridge Developer, Console User | Internal |
      | test | Foglight Operators, Cartridge Developers | Operator, Cartridge Developer, Console User | Internal |
      | Copy | Foglight Operators, Cartridge Developers | Operator, Cartridge Developer, Console User | Internal |

