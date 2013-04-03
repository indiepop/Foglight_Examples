Feature: Check Toolbar

  @Bella @wcf
  Scenario: Check Toolbar
    Given opened 'Dashboards -> WCF Regression -> Others -> Toolbar -> 520 -> Grid Layout for Toolbar 1' screen using default credentials

    When I click 'Host Selector Customizer' button
    And I click the cell in the 1st column in '[unnamed]' popup grid which contain next values:
      | Name           |
      | yammy_win2k364 (Host) |
    And wait 5 seconds

    When I click 'Links Box' button
    And I click the 'Agent Status' link
    Then 'Agent Status' screen should be displayed
    And I click the 'Grid Layout for Toolbar 1' link
    Then 'Grid Layout for Toolbar 1' screen should be displayed

    When I click 'Alarms' button
    Then 'Links Box 2 - List of Alarms' dialog should be displayed
    And I close 'Links Box 2 - List of Alarms' dialog

    When I click the 'Quest.com' button
    And wait 10 seconds
    And I close browser

