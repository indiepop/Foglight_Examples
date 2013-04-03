Feature: Agent adapters
  In order to make sure whether this function work fine
  As a Administration
  I want to test

  Background: Go to the same screen
#    Given I start monitoring log on machine 'FMS'
    Given opened 'Dashboards -> Administration -> Agents -> Agent Adapters' screen using default credentials
    Then 'Agent Adapters' screen should be displayed

  @yammy @ui
  Scenario Outline: Deactivate agent adapters
    When I check rows on 'Agent Adapters' screen grid which contain next values:
      | Name  |
      | <name> |
    And I click 'Deactivate' button
    Then 'Agent Adapters' screen grid should contain next rows in 60 seconds:
      | Status                  | Name   |
      | [img]adapter_deactive16 | <name> |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  Examples:
    | name     |
    | FglAM    |
    | XML-HTTP |

  @yammy @ui
  Scenario Outline: Activate agent adapters
    When I check rows on 'Agent Adapters' screen grid which contain next values:
      | Name   |
      | <name> |
    And I click 'Activate' button
    Then 'Agent Adapters' screen grid should contain next rows in 60 seconds:
      | Status                | Name   |
      | [img]adapter_active16 | <name> |
#    And machine 'FMS' should not contain ERROR,FATAL in log

  Examples:
    | name     |
    | FglAM    |
    | XML-HTTP |

