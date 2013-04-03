Feature: Check Links Box

  @Bella @wcf
  Scenario: Check Links Box 3
    Given opened 'Dashboards -> WCF Regression -> Others -> Links Box -> 520 -> Links Box 3 - Links Box 1 and 2 as Popup ' screen using default credentials

    When I click the 'Links Box 1 as Popup' link
    Then 'Links Box 1 - Links with Custom Labels' dialog should be displayed
    And I close 'Links Box 1 - Links with Custom Labels' dialog

    And I click the 'Links Box 1 as Temp Popup' link
    Then 'Links' popup should be displayed
    And I click 'Design' tab

    And I click the 'Links Box 2 as Popup' link
    Then 'Links Box 2 - List of Alarms' dialog should be displayed
    And I close 'Links Box 2 - List of Alarms' dialog

    And I click the 'Links Box 2 as Temp Popup' link
    Then 'Alarm' popup should be displayed
    And I click 'Design' tab

  @Bella @wcf
  Scenario: Check Links Box 1
    Given opened 'Dashboards -> WCF Regression -> Others -> Links Box -> 520 -> Links Box 1 - Links with Custom Labels' screen using default credentials

    When I click the 'Agent Status' link
    Then 'Agent Status' screen should be displayed
    And I click the 'Links Box 1 - Links with Custom Labels' link
    And I click the 'Alarms Table as Popup' link
    And I click 'Design' tab
    And 'Visit www.quest.com' link should be displayed in 120 seconds
    And I click the 'Visit www.quest.com' link
    And I close browser



#Scenario: Check Links Box 2
#Given opened 'Dashboards -> WCF Regression -> Others -> Links Box -> 520 -> Links Box 2 - List of Alarms' screen using default credentials
#
#   When I click the 'Forward Alarms as SNMP Traps' link
#   Then 'Alarm ' popup should be displayed
#   And I close 'Alarm ' dialog
#   And I click the 'Interface_Discards' link
#   Then 'Alarm Created' grid should be displayed
#   And I close 'Alarm Created' dialog




