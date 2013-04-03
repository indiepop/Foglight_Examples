Feature: test upload component and steps
  @file_upload @open_browser
  Scenario: upload in pulseNet
    Given opened 'Homes->Administration' screen using default credentials
    Then 'Administration' screen should be displayed
    When I click 'Licensing' link
    Then 'Licensing' screen should be displayed
    When I click 'Install a License' link
    Then 'Install a License' dialog should be displayed
    When I upload file "C:\pn\pne_100.license" in 'Install a License' dialog
    And wait 10 seconds
    Then I click 'Install' button in 'Install a License' dialog

  @file_upload
  Scenario: upload in foglight
    Given opened 'Dashboards->Administration->Cartridges->Cartridge Inventory' screen using default credentials
    Then 'Cartridge Inventory' screen should be displayed
    When I click 'Install Cartridge' button
    Then 'Install Cartridge' dialog should be displayed
    When I upload file "C:\pn\pne_100.license" in 'Install Cartridge' dialog
    And wait 10 seconds
    Then I click 'Install Cartridge' button in 'Install Cartridge' dialog