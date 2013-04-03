Feature: Activity -> Top SQL Statements
  As an administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario: Activity - Top SQL Statements
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I click '10.30.149.58-ORCL' link
    And I click "Home Page" button

  #  Click on 'Activity' icon on the toolbar, click on 'Top SQL Statements' option  Data is seen under 'Top SQL Statements' pane
    And I click "Activity" button on toolbar
    And I click 'Top SQL Statements' link
    Then 'Top SQL Statements' grid should not contain 'n/a'

  # Select one of the SQLs (mark it on the left)  The chart at the lower part change accordingly
    And I click the cell in the 1st column in 'Top SQL Statements' grid which contains next values:
      | Hash Value |
      | 3393152264 |
    Then 'Executions Started' chart title is displayed
    And I click 'Back to Top SQL Statements' link

  # Click on one of the SQLs and verify the 'SQL Statement Details' screen opens for this specific SQL  Verify that data is seen under all parts and fields
    And I click '1813049750' link
    Then 'Workload (Average Active Sessions)' chart title is displayed

  # Press on 'View Full Text' for SQL Text that cut  'View Full Text' is clickable, popup with full text open
    And I click 'View Full Text' link
  #  Then 'SQL Full Text' popup should be displayed
    And I close '' popup window

  # Click on 'Back to Top SQL Statements' link (top-right side of the screen)  The link leads you back to the 'Top SQL Statements'
    And I click 'Back to Top SQL Statements' link
    Then 'SQL Statements by CPU Time' message is displayed

  # Click on 'Top 50' (Upper left corner) and change the num of Top SQL Statements  Title and data are changed accordingly
    And I click 'Top 25' link
    And I click on '50' link in popup
    Then 'SQL Statements by CPU Time' message is displayed