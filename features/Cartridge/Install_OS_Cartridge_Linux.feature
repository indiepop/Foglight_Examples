fandaole Feature: Install Cartridge
  For installing cartridge
  I should have started FMS

  @yammy @cartridge
  Scenario: Install OS cartridge
    Given I have downloaded OS cartridge by the following parameters
      | protocol  | ftp                                                                                                                             |
      | server    | 10.30.149.9                                                                                                                     |
      | user name | foglight                                                                                                                        |
      | password  | foglight                                                                                                                        |
      | from      | /nightly/CatalystOSCartridge/INTERLAGOS_RELEASE_BRANCH/554-20091202-1622/Dist/dest/cartridges/OSCartridge-Linux2_6-5_5_4.car |
      | to        | /home/yammy/OSCartridge-Linux2_6-5_5_4.car                                                                                    |
    When I execute command 'chmod 777 /home/yammy/OSCartridge-Linux2_6-5_5_4.car'
    When I execute command '/home/yammy/Quest_Software/Foglight/bin/fglcmd.sh -usr foglight -pwd foglight -cmd cartridge:install -f /home/yammy/OSCartridge-Linux2_6-5_5_4.car' to install OS cartridge
    Then I receive result from command '/home/yammy/Quest_Software/Foglight/bin/fglcmd.sh -usr foglight -pwd foglight -cmd cartridge:list'
    And The following cartridges should exist in the cartridge list
      | OS-FileSystem        |
      | OS-DiskIO            |
      | OS-Linux_System      |
      | OS-Common            |
      | OS-ApacheSvr         |
      | OS-Process           |
      | OS-Linux_MPStat      |
      | OS-User              |
      | OS-OnlineHelp        |
      | OS-HostModel-UNIX    |
      | OS-AppMonitor        |
      | OS-NIC               |
      | OSCartridge-Linux2.6 |
      | OS-LogFilter         |
      | OS-NetMonitor        |
      | OS-WebMonitor        |
      | OS-SNMP              |
      | OS-HostModel-Generic |
      | OS-HostModel-Linux   |

