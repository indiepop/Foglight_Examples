Feature: Cartridge inventory
  In order to make sure whether this function work fine
  As a Administration
  I want to test

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Cartridges -> Cartridge Inventory' screen using default credentials
    Then 'Cartridge Inventory' screen should be displayed

  @yammy @ui

  Scenario: Install test cartridge
    When I click 'Install Cartridge' button
    Then 'Install Cartridge' dialog should be displayed

    When I upload file "*work_dir*/resources/test-1_0_4.car" in 'Install Cartridge' dialog
    And I click 'Install Cartridge' button in 'Install Cartridge' dialog
    Then 'Operation(s) Complete' dialog should be displayed in 100 seconds

    When I click 'OK' button
    Then 'Cartridge Inventory' screen grid should contain next rows:
      | Cartridge Name |
      | test           |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Enable test cartridge
    When I check rows on 'Cartridge Inventory' screen grid which contain next values:
      | Cartridge Name |
      | test           |
    And wait 2 seconds
    And I click 'Enable' button
    Then 'Operation(s) Complete' dialog should be displayed in 60 seconds

    When I click 'OK' button
    And I click 'unnamed' message button
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Disable test cartridge
    When I check rows on 'Cartridge Inventory' screen grid which contain next values:
      | Cartridge Name |
      | test           |
    And wait 2 seconds
    And I click 'Disable' button
    Then 'Cartridge Confirmation' dialog should be displayed in 60 seconds

    When I click 'OK' button
    Then 'Operation(s) Complete' dialog should be displayed in 60 seconds

    When I click 'OK' button
    And I click 'unnamed' message button
    Then 'Cartridge test-1.0.4 has been disabled.' message should be displayed in 100 seconds
#    And machine 'FMS' should not contain ERROR,FATAL in log

  @yammy @ui

  Scenario: Uninstall test cartridge
    When I check rows on 'Cartridge Inventory' screen grid which contain next values:
      | Cartridge Name |
      | test           |
    And wait 2 seconds
    And I click 'Uninstall' button
    Then 'Cartridge Confirmation' dialog should be displayed in 60 seconds

    When I click 'OK' button
    Then 'Operation(s) Complete' dialog should be displayed in 60 seconds

    When I click 'OK' button
    And I click 'unnamed' message button
    Then 'Cartridge test-1.0.4 has been uninstalled.' message should be displayed in 60 seconds
#    And machine 'FMS' should not contain ERROR,FATAL in log