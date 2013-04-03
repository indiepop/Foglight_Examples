Feature: Active Agent
  For making agent active
  I should have started FMS
  I should have installed cartridge and deployed cartridge
  I should have create agent

  @yammy @agent
  Scenario: Active agent
    When I execute command '/home/yammy/Quest_Software/Foglight/bin/fglcmd.sh -usr foglight -pwd foglight -cmd agent:activate -all -force' to active agent
    And I receive result from command '/home/yammy/Quest_Software/Foglight/bin/fglcmd.sh -usr foglight -pwd foglight -cmd agent:list -host #agent_host# -active true -type Linux_System -name Linux_System' to get all activated agents
    Then The 'Linux_System' agent should exist in the activated agent list