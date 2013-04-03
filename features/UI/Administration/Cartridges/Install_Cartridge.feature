Feature: Install Cartridge
  In order to install cartridge
  As a system administrator
  I should download the Infrastructure Cartridge

  @mark @ui
  Scenario: Install Cartridge
    Given opened 'Dashboards -> Administration -> Cartridges -> Cartridge Inventory' screen using default credentials
    Then 'Cartridge Inventory' screen should be displayed

    When I click 'Install Cartridge' button
    Then 'Install Cartridge' dialog should be displayed

    When I upload file "*work_dir*\resources\Infrastructure-5_6_3.car" in 'Install Cartridge' dialog
    And wait 1 seconds
    And I click 'Install Cartridge' button in 'Install Cartridge' dialog
    And wait 1 seconds
    Then 'Operation(s) Complete' dialog should be displayed

    When I click 'OK' button
    Then 'Cartridge Inventory' screen grid should contain next rows:
      | Status                      | Cartridge Name |
      | [img]cartridge_active16_new | FglAM-Adapter  |
      | [img]cartridge_active16_new | HostAgents     |
      | [img]cartridge_active16_new | Infrastructure |
      | [img]cartridge_active16_new | IntelliProfile |
    And machine 'FMS' should not contain ERROR,FATAL in log