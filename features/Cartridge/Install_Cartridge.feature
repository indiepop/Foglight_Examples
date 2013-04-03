Feature: Install Cartridge
  For installing cartridge
  I should have started FMS

  @yammy @cartridge
  Scenario: Install OS cartridge
    Given I have downloaded OS cartridge by the following parameters
      | credential | fogflsw01                                                                                                                       |
      | from       | /nightly/CatalystOSCartridge/INTERLAGOS_RELEASE_BRANCH/554-20091202-1622/Dist/dest/cartridges/OSCartridge-Windows2003-5_5_4.car |
      | to         | C:/OSCartridge-Windows2003-5_5_4.car                                                                                            |
    When I execute command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd cartridge:install -f C:/OSCartridge-Windows2003-5_5_4.car' to install OS cartridge
    Then I receive result from command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd cartridge:list'
    And The following cartridges should exist in the cartridge list
      | OSCartridge-Windows2003 |
      | OS-Windows_System       |
      | OS-HostModel-Windows    |
      | OS-HostModel-Generic    |
      | OS-TerminalServer       |
      | OS-SNMP                 |
      | OS-Common               |
      | OS-NetMonitor           |
      | OS-AppMonitor           |
      | OS-LogFilter            |
      | OS-ApacheSvr            |
    And machine 'FMS' should not contain ERROR,FATAL in log
