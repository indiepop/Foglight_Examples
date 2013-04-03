Feature: Test Icon

  Scenario: Click Icon (pulseNet server: 10.30.149.11)
    Given opened 'Homes->Summary' screen using default credentials
    And 'Summary' screen should be displayed
    When I click 'service16.png' icon
    Then '[unnamed]' grid should contain next rows:
      | Permission     |
      | SNMP Discovery |
    When I click 'Permission' cell in rows in '[unnamed]' grid which contain next values:
      | Permission     |
      | SNMP Discovery |