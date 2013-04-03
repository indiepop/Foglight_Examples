Feature: Activity -> Top SQL Statements
  As a  administrator role


  @In_progress  @Regression @Smoke @flora
  Scenario:  Activity - Top SQL Statements
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click "Home Page" button

  #  Click on 'Activity' icon on the toolbar, click on 'Top SQL Statements' option  Data is seen under 'Top SQL Statements' pane
    And I click "Activity" button
    And I click 'Top SQL Statements' link
    Then 'Top 25 SQL Statements by CPU Time' message is displayed

  # Select one of the SQLs (mark it on the left)  The chart at the lower part change accordingly
    And I select rows in 'Top SQL Statements' grid which contains next values:
      | Hash Value |
      | 4281219134 |
    Then 'Executions Started' chart is displayed

  # Click on one of the SQLs and verify the 'SQL Statement Details' screen opens for this specific SQL  Verify that data is seen under all parts and fields
    And  I click '940003449' link in 'Top SQL Statements' grid
    Then 'SQL Statement Details (940003449)' message is displayed


  # Press on 'View Full Text' for SQL Text that cut  'View Full Text' is clickable, popup with full text open
    And I click 'View Full Text' link
    Then 'SQL Full Text' popup should be displayed
    And I
  close 'SQL Full Text' popup

  # Click on 'Back to Top SQL Statements' link (top-right side of the screen)  The link leads you back to the 'Top SQL Statements'
    And I click 'Back to Top SQL Statements' link
    Then 'Top 25 SQL Statements by CPU Time' message is displayed

  # Click on 'Top 50' (Upper left corner) and change the num of Top SQL Statements  Title and data are changed accordingly
    And I click 'Top 25' link
    And I click '50' link
    Then 'Top 50 SQL Statements by CPU Time' message is displayed



