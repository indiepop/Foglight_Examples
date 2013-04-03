Feature: Deploy Cartridge
  For deploying cartridge
  I should have started FMS
  I should have installed cartridge

  @yammy @cartridge
  Scenario: Deploy cartridge
    When I execute command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd agent:deploy -host #agent_host# -allpackages -force' to deploy Infrastructure cartridge
    Then I check whether cartridge deploy successfully by the following parameters
    And machine 'FMS' should not contain ERROR,FATAL in log