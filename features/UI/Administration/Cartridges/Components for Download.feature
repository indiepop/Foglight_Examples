Feature: Components for Download
  In order to check Components for Download dashboard
  As a system administrator
  I want to check FglAM installation package exist in Components for Download dashboard

  @Ellen @ui
  Scenario: Components for Download
    Given opened 'Dashboards -> Administration -> Cartridges -> Cartridge Inventory' screen using default credentials
    Then 'Cartridge Inventory' screen should be displayed

    When I click 'Install Cartridge' button
    Then 'Install Cartridge' dialog should be displayed

    When I upload file "*work_dir*\resources\FglAM-windows-ia32-5_6_2_2.car" in 'Install Cartridge' dialog
    And wait 1 seconds
    And I click 'Install Cartridge' button in 'Install Cartridge' dialog
    And wait 1 seconds
#    Then 'Operation(s) Complete' dialog should be displayed
    When I click 'OK' button
    Then 'Cartridge Inventory' screen grid should contain next rows:
      | Status                      | Cartridge Name               |
      | [img]cartridge_active16_new | FglAM-Adapter                |
      | [img]cartridge_active16_new | FglAM-Common                 |
      | [img]cartridge_active16_new | FglAM-Installer-windows-ia32 |
      | [img]cartridge_active16_new | IntelliProfile               |
      | [img]cartridge_active16_new | Usage-Feedback               |
      | [img]cartridge_active16_new | FglAM-JRE-windows-ia32       |
      | [img]cartridge_active16_new | FglAM-Native-windows-ia32    |
      | [img]cartridge_active16_new | FglAM-windows-ia32           |

    When opened 'Dashboards -> Administration -> Cartridges -> Components for Download' screen
    Then 'Components For Download' screen should be displayed
    And 'Components For Download' screen grid should contain next rows:
      | Name                                  | Cartridge Name|
      | fglam-devkit-5_6_2_2-windows-ia32.zip | FglAM         |
      | fglam-5_6_2_2-windows-ia32.exe        | FglAM         |

    When I click 'fglam-devkit-5_6_2_2-windows-ia32.zip' link
    Then  'Download Message' dialog should be displayed

    When I click 'fglam-5_6_2_2-windows-ia32.exe' link
    Then  'Download Message' dialog should be displayed