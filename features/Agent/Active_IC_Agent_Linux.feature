Feature: Active IC agent
  In order to make sure whether agent is fine
  As a Administration
  I want to active ic agent

  @yammy @agent
  Scenario: Active IC agent
    When I execute command 'C:/Quest_Software/Foglight/bin/fglcmd.bat -usr foglight -pwd foglight -cmd agent:activate -all -force' to active agent
    And I receive result from command 'C:/Quest_Software/Foglight/bin/fglcmd.bat -usr foglight -pwd foglight -cmd agent:list -host #agent_host# -active true -type WindowsAgent -name Windows_IC_Agent' to get all active agent on win2k3-32 fglam
    Then The 'Windows_IC_Agent' agent should exist in the active agent list