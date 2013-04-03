Feature: Create Agent
  For creating agent
  I should have started FMS
  I should have installed cartridge and deployed cartridge

  @yammy @agent
  Scenario: Create agent
    When I execute command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd agent:create -type Windows_System -host #agent_host# -name Windows_System -regex -force' to create agent
    Then I receive result from command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd agent:list -host #agent_host# -name Windows_System' to get all agent
    And The 'Windows_System' agent should exist in the agent list
    And machine 'FMS' should not contain ERROR,FATAL in log
