Feature: Activity -> Event Categories Breakdown
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario:  Activity - Sessions
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click "Home Page" button
  #  Click on 'Activity' icon on the toolbar, click on 'Sessions' option
    And I click "Activity" button
    And I click 'Sessions' link
  # Data is seen under 'Sessions' Pane
    Then 'Sessions' message is displayed

  # Resource Breakdown (upper-left corner)  Value for 'CPU Usage' and 'CPU Wait' is 'Requires StealthCollect'
    Then  'Resource Breakdown' in 'Activity' screen should contain rows
      | Resource  | % of Workload           |
      | CPU Usage | Requires StealthCollect |
      | CPU Wait  | Requires StealthCollect |

  # Values for all other Resources
  # Resource change list  Change between resource, chart change accordingly

  Session Grid (bottom-right)  Grid is for 'Current Sessions'
  'Top Sessions' is NOT clickable

  Press on the arrow near the grid, add column -> The columns appear in the grid

  The first column has no name, pic for power for some rows

  Press on the pic, Kill session pop-up open

  'Session Details for Session x' Pane (x = SID)  On the sessions grid click on any SID -> Open dashboard for 'Session Details for Session x' Pane (x = SID)

  Data is seen for 'Session Overview' tab
  For all other tabs "Data for this tab is available only when the StealthCollect agent is installed and configured"


