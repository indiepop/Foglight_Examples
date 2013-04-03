Feature: Deploy Cartridge
  For deploying cartridge
  I should have started FMS
  I should have installed cartridge

  @yammy @cartridge
  Scenario: Deploy cartridge
    When I execute command '/home/yammy/Quest_Software/Foglight/bin/fglcmd.sh -usr foglight -pwd foglight -cmd agent:deploy -host #agent_host# -allpackages -force' to deploy Infrastructure cartridge
    Then I check whether cartridge deploy successfully by the following parameters