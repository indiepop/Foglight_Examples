Feature: Create Schedule on Manage Schedules Dashboard
  In order to make sure whether add schedule successed
  As a Administration
  I want to create schedule

  @Ellen @ui @todo
  Scenario: Create Schedule on Manage Schedules Dashboard
    Given opened 'Dashboards -> Administration -> Cartridges -> Cartridge Inventory' screen using default credentials
    Then 'Cartridge Inventory' screen should be displayed
    When I click 'Install Cartridge' button
    Then 'Install Cartridge' dialog should be displayed
    When I upload file "*work_dir*\resources\Core-Administration-Zhuhai-5_6_2.car" in 'Install Cartridge' dialog
    And wait 1 seconds
    And I click 'Install Cartridge' button in 'Install Cartridge' dialog
    And wait 1 seconds
    When I click 'OK' button

    Then opened 'Dashboards -> Administration -> Schedules -> Manage Schedules' screen using default credentials
    Then 'Manage Schedules' screen should be displayed

    And I click 'Add' button
    Then 'Create Schedule' dialog should be displayed
    And wait 1 seconds
    And I click 'Next' button
    And wait 1 seconds
    And I click 'Next' button
    And wait 1 seconds
    And I fill 'Create Schedule' dialog with next values:
    | Schedule Name:         | TestOnce        |
    | Schedule Description : | automation Test |
    And I click 'Finish' button
    Then 'Manage Schedules' screen grid should contain next rows:
    | Schedule Name |
    | TestOnce      |

    And I click 'Add' button
    Then 'Create Schedule' dialog should be displayed
    And wait 1 seconds
    And I click 'Next' button
    And wait 1 seconds
    When I click on the 2nd radio after 'Recurrence' text
    And I click 'Next' button
    And wait 1 seconds
    And I click 'Next' button
    And wait 1 seconds
    And I click 'Next' button
    And wait 1 seconds
    And I fill 'Create Schedule' dialog with next values:
    | Schedule Name:         | TestInterval    |
    | Schedule Description : | automation Test |
    And I click 'Finish' button
    And wait 10 seconds
    And I refresh the browser
    Then 'Manage Schedules' screen grid should contain next rows:
    | Schedule Name |
    | TestInterval  |

#    And I click 'Add' button
#    Then 'Create Schedule' dialog should be displayed
#    And wait 1 seconds
#    And I click 'Next' button
#    And wait 1 seconds
#    When I click on the 3rd radio after 'Recurrence' text
#    And I click 'Next' button
#    And wait 1 seconds
#    And I click 'Next' button
#    And wait 1 seconds
#    And I click 'Next' button
#    And wait 1 seconds
#    And I fill 'Create Schedule' dialog with next values:
#    | Schedule Name:         | TestDaily       |
#    | Schedule Description : | automation Test |
#    And I click 'Finish' button
#    And wait 10 seconds
#    Then 'Manage Schedules' screen grid should contain next rows:
#    | Schedule Name |
#    | TestDaily     |

#
#    And I click 'Add' button
#    Then 'Create Schedule' dialog should be displayed
#    And wait 1 seconds
#    And I click 'Next' button
#    And wait 1 seconds
#    When I click on the 5th radio after 'Recurrence' text
#    And I click 'Next' button
#    And wait 1 seconds
#    And I click 'Next' button
#    And wait 1 seconds
#    And I click 'Next' button
#    And wait 1 seconds
#    And I fill 'Create Schedule' dialog with next values:
#    | Schedule Name:         | TestMonthly       |
#    | Schedule Description : | automation Test |
#    And I click 'Finish' button
#    Then 'Manage Schedules' screen grid should contain next rows:
#    | Schedule Name |
#    | TestMonthly   |
#
#    And I click 'Add' button
#    Then 'Create Schedule' dialog should be displayed
#    And wait 1 seconds
#    And I click 'Next' button
#    And wait 1 seconds
#    When I click on the 6th radio after 'Recurrence' text
#    And I click 'Next' button
#    And wait 1 seconds
#    And I click 'Next' button
#    And wait 1 seconds
#    And I click 'Next' button
#    And wait 1 seconds
#    And I fill 'Create Schedule' dialog with next values:
#    | Schedule Name:         | TestYearly      |
#    | Schedule Description : | automation Test |
#    And I click 'Finish' button
#    Then 'Manage Schedules' screen grid should contain next rows:
#    | Schedule Name |
#    | TestYearly    |


