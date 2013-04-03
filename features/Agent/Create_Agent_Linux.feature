Feature: Create Agent
  For creating agent
  I should have started FMS
  I should have installed cartridge and deployed cartridge

  @yammy @agent
  Scenario: Create agent
    When I execute command '/home/yammy/Quest_Software/Foglight/bin/fglcmd.sh -usr foglight -pwd foglight -cmd agent:create -type Linux_System -host #agent_host# -name Linux_System -regex -force' to create agent
    Then I receive result from command '/home/yammy/Quest_Software/Foglight/bin/fglcmd.sh -usr foglight -pwd foglight -cmd agent:list -host #agent_host# -name Linux_System' to get all agent
    And The 'Linux_System' agent should exist in the agent list
