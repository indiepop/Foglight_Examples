Feature: Activity - Sessions
  As an administrator role


  @Regression @Smoke @flora
  Scenario: Activity - Sessions
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I click '10.30.149.58-ORCL' link
    And I click "Home Page" button
  #  Click on 'Activity' icon on the toolbar, click on 'Sessions' option
    And I click "Activity" button on toolbar
    And I click 'Sessions' link
  # Data is seen under 'Sessions' Pane
    Then 'Sessions' message is displayed

  # Resource Breakdown (upper-left corner)  Value for all Resources
    And grid in 'Resource Breakdown' box should not contain 'n/a'
  # Values for all other Resources
  # Resource change list  Change between resource, chart change accordingly

  # Session Grid (bottom-right)  Grid is for 'Current Sessions'
    And 'Current Sessions' message is displayed
  # 'Top Sessions' is clickable
    And I click 'Top Sessions' link

  # Press on the arrow near the grid, add column -> The columns appear in the grid
    And I click customizer in 'Sessions List' panel grid
    And I select 'Columns Details' in popup menu
  # Then 'Choose Column Details:' popup should be displayed
  # And I click 'Action' checkbox
    And I fill 'Choose Column Details:' popup box with next values:
      | [right]Action | on |
    Then 'Session Action' message is displayed
    And I click 'OK' button

  # The first column has no name, pic for power for some rows
  # Press on the pic, Kill session pop-up open
    And I click the cell in the 1st column in 'Sessions List' grid which contains next values:
      | SID |
      | 159 |
    And I close 'Kill Session' popup window

  # 'Session Details for Session x' Pane (x = SID)  On the sessions grid
  # click on any SID -> Open dashboard for 'Session Details for Session x' Pane (x = SID)
    And I click 'SID' cell on rows in 'Sessions List' grid which contains next values:
      | SID |
      | 159 |
    Then 'Session Details for Session 159' message is displayed

  # Data is seen for 'Session Overview' tab
    And I click 'Session Overview' tab
    Then 'Session Overview' grid should not contain 'n/a'
  # For all other tabs "Data for this tab is available only when the StealthCollect agent is installed and configured"
    And I click 'Session Statistics' tab
    And I click 'Open Cursors' tab
    And I click 'Session Locks' tab
    And I click 'Datafile I/O' tab
    And I click 'SQL Summary' tab
    Then 'SQL Summary' grid should not contain 'n/a'



