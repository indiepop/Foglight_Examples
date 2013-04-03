Feature: Install Cartridge
  In order to install cartridge
  As a system administrator
  I should download the WCF Regression Cartridge

  Scenario: Install Cartridge
    Given opened 'Dashboards -> Administration -> Cartridges -> Cartridge Inventory' screen using default credentials
    Then 'Cartridge Inventory' screen should be displayed
    When I click 'Install Cartridge' button
    Then 'Install Cartridge' dialog should be displayed
    When I upload file "C:\WCF_Regression_562-1_0_5.car" in 'Install Cartridge' dialog
    And wait 10 seconds
    And I click 'Install Cartridge' button in 'Install Cartridge' dialog
    And I click 'Install Cartridge' button
    And wait 10 seconds
    Then 'Operation(s) Complete' dialog should be displayed
    When I click 'OK' button
    Then 'Cartridge Inventory' screen grid should contain next rows:
      | Cartridge Name |  Version |
      | WCF_Regression_562 | 1.0.5|
