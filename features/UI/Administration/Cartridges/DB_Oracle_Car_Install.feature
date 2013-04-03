Feature: Installation for Oracle cartridge
  In order to use Oracle cartridge to monitor Oracle DB
  As a  administrator role

  @mark
  Scenario:Install DBWC Oracle cartridge
    Given opened 'Dashboards -> Administration -> Cartridges -> Cartridge Inventory' screen using default credentials
    Then 'Cartridge Inventory' screen should be displayed
    When I click 'Install Cartridge' button
    Then 'Install Cartridge' dialog should be displayed
    When I upload file "*work_dir*\resources\DB_Oracle-5_5_8_560.car" in 'Install Cartridge' dialog
    And wait 1 seconds
    And I click 'Install Cartridge' button in 'Install Cartridge' dialog
    Then 'Operation(s) Complete' dialog should be displayed in 400 seconds
    When I click 'OK' button
    And wait 5 seconds
    Then 'Cartridge Inventory' screen grid should contain next rows:
      | Cartridge Name              |
      | DB_Auto_Discovery_Oracle    |
      | DB_Auto_Discovery_Oracle_UI |
      | DB_Dbwc_Common_Oracle       |
      | DB_Dbwc_Common_Oracle_UI    |
      | DB_Global_View_UI           |
      | DB_Oracle                   |
      | DB_Oracle_UI                |
