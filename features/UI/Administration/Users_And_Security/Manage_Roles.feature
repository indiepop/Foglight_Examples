Feature: Roles Management
  In order to ensure the groups management works good
  As a tester
  I want to add, edit and delete roles

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed
    When I click 'Manage Users, Groups, Roles' link
    Then 'User Management' message should be displayed
    When I click 'Roles' tab

  @yammy @ui
  Scenario Outline: Adding a role
    And I click 'New Role' button
    Then 'New Role' dialog should be displayed

    When I fill 'New Role' dialog with next values:
      | Name | <name> |
    And I type 'test role' into textarea
    And I click 'Next' button in 'New Role' dialog

    When I check rows on 'New Role' dialog grid which contain next values:
      | Group Names             |
      | Foglight Administrators |
    And I click 'Finish' button in 'New Role' dialog
    Then 'Users & Security Management' screen grid should contain next rows:
      | Name   | Groups                  |
      | <name> | Foglight Administrators |

  Examples:
    | name    |
    | Yammy   |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |

#  @yammy @ui
#  Scenario: Search a role
#    And wait 10 seconds
#    When I type 'Yammy' into search field in 'User Management' screen
#    And wait 10 seconds
#    Then 'User Management' screen grid should contain next rows:
#      | Name  |
#      | Yammy |
#
#  Examples:
#    | name    |
#    | Yammy   |
#    | test    |
#    | 1       |
#    | .yammy  |
#    | 珠海虹天 |

  @yammy @ui
  Scenario Outline: Edit a role
    And I click 'Name' cell in rows in 'User Management' screen grid which contain next values:
      | Name  |
      | <name> |
    Then 'Editting role' dialog should be displayed

    When I click 'Next' button on 'Editting role' dialog
    Then 'Select groups to assign to <name>' message should be displayed

    When I check rows on 'Editting role' dialog grid which contain next values:
      | Group Names        |
      | Foglight Operators |
    And I click 'Finish' button on 'Editting role' dialog
    Then 'Users & Security Management' screen grid should contain next rows:
      | Name   | Groups                                      |
      | <name> | Foglight Operators, Foglight Administrators |

  Examples:
    | name    |
    | Yammy   |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |

  @yammy @ui
  Scenario: Remove a role
    And I check rows on 'User Management' screen grid which contain next values:
      | Name  |
      | Yammy |
    And I click 'Remove Roles' button
    Then 'Delete Objects' dialog should be displayed

    When I click 'Delete' button
    Then 'User Management' screen grid should not contain next rows:
      | Yammy | Foglight Operators, Foglight Administrators |

  @yammy @ui
  Scenario: Remove some roles
    And I check rows on 'User Management' screen grid which contain next values:
      | Name |
      | 1    |
      | test |
      | 珠海虹天 |
    And I click 'Remove Roles' button
    Then 'Delete Objects' dialog should be displayed

    When I click 'Delete' button
    Then 'User Management' screen grid should not contain next rows:
      | 1       | Foglight Operators, Foglight Administrators |
      | test    | Foglight Operators, Foglight Administrators |
      | 珠海虹天 | Foglight Operators, Foglight Administrators |