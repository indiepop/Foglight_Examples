Feature: Active Agent
  For making agent active
  I should have started FMS
  I should have installed cartridge and deployed cartridge
  I should have create agent

  @yammy @agent
  Scenario: Active agent
    When I execute command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd agent:activate -all -force' to active agent
    And I receive result from command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd agent:list -host #agent_host# -active true -type Windows_System -name Windows_System' to get all activated agents
    Then The 'Windows_System' agent should exist in the activated agent list
    And machine 'FMS' should not contain ERROR,FATAL in log