Feature: Activity -> Top SQL Statements
  As an administrator role

  @mark @TODO
  Scenario: Activity - Top SQL Statements
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
  #    Then '10.30.149.39-ORCL' screen should be displayed
    When I click 'activity.png' icon
    Then '[unnamed]' popup should be displayed
    And I click 'Top SQL Statements' link in '[unnamed]' popup
    Then 'Top SQL Statements' message should be displayed
#    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
#    And I click 'ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102' link
#    And I click "Home Page" button
#
#  #  Click on 'Activity' icon on the toolbar, click on 'Top SQL Statements' option  Data is seen under 'Top SQL Statements' pane
#    And I click "Activity" button on toolbar
#    And I click 'Top SQL Statements' link
#    Then 'Top SQL Statements' grid should not contain 'n/a'
#
#  # Select one of the SQLs (mark it on the left)  The chart at the lower part change accordingly
#    And I click the cell in the 1st column in 'Top SQL Statements' grid which contains next values:
#      | Hash Value |
#      | 4281219134 |
#    Then 'Executions Started' chart title is displayed
#    And I click 'Back to Top SQL Statements' link
#
#  # Click on one of the SQLs and verify the 'SQL Statement Details' screen opens for this specific SQL  Verify that data is seen under all parts and fields
#    And I click '1241701731' link
#    Then 'Workload (Average Active Sessions)' chart title is displayed
#
#  # Press on 'View Full Text' for SQL Text that cut  'View Full Text' is clickable, popup with full text open
#    And I click 'View Full Text' link
#  #  Then 'SQL Full Text' popup should be displayed
#    And I close '' popup window
#
#  # Click on 'Back to Top SQL Statements' link (top-right side of the screen)  The link leads you back to the 'Top SQL Statements'
#    And I click 'Back to Top SQL Statements' link
#    Then 'SQL Statements by CPU Time' message is displayed
#
#  # Click on 'Top 50' (Upper left corner) and change the num of Top SQL Statements  Title and data are changed accordingly
#    And I click 'Top 25' link
#    And I click on '50' link in popup
#    Then 'SQL Statements by CPU Time' message is displayed