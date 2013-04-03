Feature: Check links on Administration Dashboard
  In order to make sure all the links navigate to the right page
  As a Administration
  I want to click all the links on navigation

  Background: Go to the administration screen
    Given opened 'Dashboards -> Administration -> Administration' screen using default credentials
    Then 'Administration' screen should be displayed

  @yammy @ui

  Scenario Outline: Clicking links on navigation
    When I click '<links>' link
    Then '<screen>' screen should be displayed in 60 seconds
#    And machine 'FMS' should not contain ERROR,FATAL in log

  Examples:
    | links                       | screen                          |
    | Status                      | Agent Status                    |
    | Properties                  | Agent Properties                |
    | Hosts Running Agents        | Agent Managers                  |
    | Support Bundles             | Agent Manager Support Bundle    |
    | Adapters                    | Agent Adapters                  |
    | Data Management             | Data Management                 |
    | Metrics                     | Manage Derived Metrics          |
    | Metric Diagnostics          | Derived Metrics                 |
    | Intelliprofile              | IntelliProfile                  |
    | Thresholds                  | Manage Thresholds               |
    | Topology Types              | Add Topology Type               |
    | Configuration               | Management Server Configuration |
    | Audit Information           | View Audit Information          |
    | Blackouts                   | Blackouts                       |
#    | Connection Status           | Connection Status               |
    | Email                       | Email Configuration             |
    | Licenses                    | Manage Licenses                 |
    | Credential Management       | Credentials                     |
    | Rules                       | Rule Management                 |
    | Rule Diagnostics            | Rule Diagnostics                |
    | Variables                   | Manage Registry Variables       |
    | Server Log Overview         | Log Overview                    |
    | Server Performance Overview | Performance Overview            |
    | Script Agent Builder        | Script Agent Builder View       |
    | Script Console              | Script Console                  |
    | Inventory                   | Cartridge Inventor              |
    | Component Download          | Components For Download         |
    | Schedule Management         | Manage Schedules                |
    | Users & Security Management | Users & Security Management     |

  @yammy @ui

  Scenario: checking the 2nd ''Support Bundles' link'
    When I click the 2nd 'Support Bundles' link
    Then 'Manage Support Bundles' screen should be displayed in 60 seconds
#    And machine 'FMS' should not contain ERROR,FATAL in log



