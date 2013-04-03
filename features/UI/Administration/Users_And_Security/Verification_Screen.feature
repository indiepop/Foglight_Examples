Feature: Verification screen on Users & Security Dashboard
  In order to make sure those screen works fine
  As a Administration
  I want to do some execute

 Background: Go to the Users & Security screen
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed

  @yammy @ui
  Scenario Outline: Clicking links on navigation
    When I click '<link>' link
    Then '<screen>' screen should be displayed

  Examples:
    | link                        | screen                       |
    | Manage Users, Groups, Roles | User Management              |
    | Password Policy Settings    | Password Settings            |
    | Directory Services Settings | Configure Directory Services |

