Feature: Groups Management
  In order to ensure the groups management works good
  As a tester
  I want to add, modify, search and delete groups

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed
    When I click 'Manage Users, Groups, Roles' link
    Then 'User Management' message should be displayed
    When I click 'Groups' tab

  @yammy @ui
  Scenario Outline: Adding a group
    And I click 'New Group' button
    Then 'New Group' dialog should be displayed

    When I fill 'New Group' dialog with next values:
      | Name | <name> |
    And I type 'test group' into textarea
    And I click 'Next' button on 'New Group' dialog
    Then 'Select users to assign to' message should be displayed

    When I check rows on 'New Group' grid which contain next values:
      | User Names |
      | <name>   |
    And I click 'Next' button on 'New Group' dialog
    Then 'Select roles to assign to' message should be displayed

    When I check rows on 'New Group' grid which contain next values:
      | Role Names    |
      | Administrator |
    And I click 'Finish' button on 'New Group' dialog
    Then 'User Management' screen grid should contain next rows:
      | Name   | Roles         | Users  | Type     |
      | <name> | Administrator | <name> | Internal |

   Examples:
    | name    |
    | Yammy   |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |

#  @yammy @ui
#  Scenario: Search a group
#    And wait 10 seconds
#    And I refresh the browser
#    When I type 'Yammy' into search field in 'User Management' screen
#    And wait 10 seconds
#    Then 'User Management' screen grid should contain next rows:
#      | Name  |
#      | Yammy |
#
#   Examples:
#    | name    |
#    | Yammy   |
#    | test    |
#    | 1       |
#    | .yammy  |
#    | 珠海虹天 |

  @yammy @ui
  Scenario Outline: Edit a group
    And I click 'Name' cell in rows in 'User Management' screen grid which contain next values:
      | Name   |
      | <name> |
    Then 'Editting group' dialog should be displayed

    When I click 'Next' button on 'Editting group' dialog
    Then 'Select users to assign to <name>' message should be displayed

    When I check rows on 'Editting group' dialog grid which contain next values:
      | User Names |
      | foglight   |
    And I click 'Next' button on 'Editting group' dialog

    When I check rows on 'Editting group' dialog grid which contain next values:
      | Role Names          |
      | Cartridge Developer |
      | Console User        |
    And I click 'Finish' button on 'Editting group' dialog
    Then 'User Management' screen grid should contain next rows:
      | Name  | Roles                                            | Type     |
      | Yammy | Administrator, Cartridge Developer, Console User | Internal |

  Examples:
    | name    |
    | Yammy   |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |

  @yammy @ui
  Scenario: Remove a group
    And I check rows on 'User Management' screen grid which contain next values:
      | Name  |
      | Yammy |
    And I click 'Remove Groups' button
    Then 'Delete Objects' dialog should be displayed

    When I click 'Delete' button
    And 'User Management' screen grid should not contain next rows:
      | Yammy | Administrators | Yammy | Internal |

  @yammy @ui
  Scenario: Remove some groups
    And I check rows on 'User Management' screen grid which contain next values:
      | Name |
      | 1    |
      | test |
      | 珠海虹天 |
    And I click 'Remove Groups' button
    Then 'Delete Objects' dialog should be displayed

    When I click 'Delete' button
    And 'User Management' screen grid should not contain next rows:
      | 1       | Administrators | 1       | Internal |
      | test    | Administrators | test    | Internal |
      | 珠海虹天 | Administrators | 珠海虹天 | Internal  |
