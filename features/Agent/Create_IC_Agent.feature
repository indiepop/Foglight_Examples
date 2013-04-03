Feature: Create Agent
  For creating agent
  I should have started FMS
  I should have installed cartridge and deployed cartridge

  @yammy @agent
  Scenario: Create WindowsAgent
    When I execute command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd agent:create -type WindowsAgent -host #agent_host# -name Windows_IC_Agent -regex -force' to create Windows_System agent
    Then I receive result from command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd agent:list -host #agent_host# -name Windows_IC_Agent' to get all agent on win2k3-32 fglam
    And The 'Windows_IC_Agent' agent should exist in the agent list
