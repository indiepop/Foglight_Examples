Feature: Check links on Administration Dashboard
  In order to make sure all the links navigate to the right page
  As a Administration
  I want to click all the links on navigation

  Background: Go to the administration screen
    Given opened 'Dashboards -> Administration -> Administration' screen using default credentials
    Then 'Administration' screen should be displayed

  @yammy @ui @smoke
  Scenario Outline: Clicking links on Administration below part
    When I click '<link>' link
    Then '<screen>' screen should be displayed in 60 seconds
#    And machine 'FMS' should not contain ERROR,FATAL in log

  Examples:
    | link                         | screen                          |
    | Active Agents                | Agent Status                    |
    | Installed Cartridges         | Cartridge Inventory             |
    | Server Version               | Management Server Configuration |
    | Server OS                    | Management Server Configuration |
    | Mode                         | Foglight Server Topology        |
    | Children                     | Foglight Server Topology        |
    | Standalone                   | Foglight Server Topology        |
    | Peers                        | HA Detail Information           |
    | Installed Licenses           | Manage Licenses                 |
    | Expired Licenses             | Manage Licenses                 |
    | Licenses Expiring in 30 Days | Manage Licenses                 |

  @yammy @ui @smoke
  Scenario Outline: checking the 2nd ''Support Bundles' link'
    When I click the 2nd '<link>' link
    Then '<screen>' screen should be displayed in 60 seconds
#    And machine 'FMS' should not contain ERROR,FATAL in log

  Examples:
    | link  | screen          |
    | Rules | Rule Management |
    | Users | User Management |

  @yammy @ui @smoke
  Scenario: checking the 3rd 'Status' link
    When I click the 2nd 'Status' link
    Then 'HA Detail Information' screen should be displayed in 60 seconds
#    And machine 'FMS' should not contain ERROR,FATAL in log

