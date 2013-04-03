Feature: Install Cartridge
  For installing cartridge
  I should have started FMS

  @yammy @cartridge
  Scenario: Install IC cartridge                                                                                         |
    When I execute command '#foglight_installation_path#/*build_number*/bin/fglcmd.bat -usr foglight -pwd foglight -cmd cartridge:install -f D:/svn_code/Foglight/trunk/resources/Infrastructure-5_6_3.car' to install OS cartridge
    Then I receive result from command '#foglight_installation_path#/*build_number*/in/fglcmd.bat -usr foglight -pwd foglight -cmd cartridge:list'
#    And The following cartridges should exist in the cartridge list
#      | Infrastructure          |
#      | IntelliProfile          |
