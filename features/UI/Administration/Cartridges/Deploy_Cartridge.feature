Feature: Deploy Cartridge
  In order to Deploy Cartridge
  As a system administrator
  I should have installed cartridge

  @yammy @cartridge
  Scenario: Deploy cartridge
    When I execute command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd agent:deploy -host #agent_host# -allpackages -force' to deploy IC cartridge
    Then I check whether cartridge deploy successfully by the following parameters