Feature: NoUserLogin
  In order to see alarm page through the link without login
  As a system administrator
  I should create a NologinUser and configure to see alarm page through the link without login

  @mark @ui
  Scenario: Create the NoLoginUser
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed
    When I click 'Manage Users, Groups, Roles' link
    Then 'User Management' screen should be displayed

    When I click 'New User' button
    Then 'New User' dialog should be displayed

    When I fill 'New User' dialog with next values:
      | Name | NologinUser |
    And I click 'Next' button
    And wait 1 seconds
    When I click 'Next' button
    And I fill 'New User' dialog with next values:
      | Password                                 | abcdefg1 |
      | Confirm Password                         | abcdefg1 |
      | Change Password at the next logon[right] | off      |
    And I click 'Finish' button
    Then 'Make User Progress' dialog should be displayed
    And 'Users Saved' message should be displayed
    When I click 'Ok' button
    Then 'User Management' screen grid should contain next rows:
      | Name        | Groups           | Roles           | Type     |
      | NologinUser | Assign groups... | Assign roles... | Internal |

    When I click 'Roles' tab
    And I click 'New Role' button
    Then 'New Role' dialog should be displayed

    When I fill 'New Role' dialog with next values:
      | Name | NoLogin |
    And I click 'Next' button
    And wait 1 seconds
    And I click 'Finish' button
    Then 'User Management' screen grid should contain next rows:
      | Name    | Groups           |
      | NoLogin | Assign groups... |

    When I click 'Groups' tab
    And I click 'New Group' button
    Then 'New Group' dialog should be displayed

    When I fill 'New Group' dialog with next values:
      | Name | NoLogin Required |
    And I click 'Next' button
    And I check rows on 'New Group' dialog grid which contain next values:
      | User Names  |
      | NologinUser |
    And I click 'Next' button
    And I check rows on 'New Group' dialog grid which contain next values:
      | Role Names   |
      | Console User |
      | NoLogin      |
    And I click 'Finish' button
    Then 'User Management' screen grid should contain next rows:
      | Name             | Roles                 | Users       |
      | NoLogin Required | NoLogin, Console User | NologinUser |

    When I click 'Users & Security Management' link
    Then 'Users & Security Management' screen should be displayed
    When I click 'Manage Users, Groups, Roles' link
    Then 'User Management' screen should be displayed

    When I click 'Take on 8 roles' link
    Then '[unnamed]' popup should be displayed
    And wait 1 seconds
    When I check rows on '[unnamed]' popup grid which contain next values:
      | Role Names          |
      | Cartridge Developer |
    And I click 'Save' button
    Then 'User Management' screen grid should contain next rows:
      | Name     | Groups                                                    | Roles           |
      | foglight | Foglight Security Administrators, Foglight Administrators | Take on 9 roles |

    When I click 'Sign Out' link
    And opened 'Dashboards -> Alarms' screen using default credentials
    Then 'Alarms' screen should be displayed

    When I click 'Properties…' link
    And wait 1 seconds
    When I click 'Link to this page…' link
    Then 'Link to this Page' dialog should be displayed
    When I check rows on 'Link to this Page' grid which contain next values:
      | Reference Id | system:core_alarms.231 |
    And I click 'OK' button
    Then 'Alarms' screen should be displayed

    When opened 'Dashboards -> Configuration -> Definitions' screen
    And I navigate to 'Alarms -> AlarmFilter' in 'Definitions' tree
    And I click rows in the 1st grid which contain next values:
      | Name                                |
      | Alarm List with Filter - Alarm List |
    And I click 'Edit' button
    And wait 1 seconds
    When I click 3rd 'editItem.png' icon
    And wait 1 seconds
    When I click 'NoLogin' checkbox in '[unnamed]' popup
    And wait 1 seconds
    When I click 'Apply' button
    And wait 3 seconds
    And I click 'Save' button
    And I click 'Sign Out' link
    When I navigate to 'http://#host#:8080/console/foglight_ext?viewId=system:core_alarms.231' url
    Then 'Alarms' message should be displayed
    And I close browser
#    And machine 'FMS' should not contain ERROR,FATAL in log