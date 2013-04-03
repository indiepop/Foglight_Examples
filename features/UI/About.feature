Feature: About Foglight
  In order to check the Foglight environment and build information
  As a system user
  I should able to open the "About" box and see the information

  @ryan @ui
  Scenario: Check the panel About Foglight
    Given I close browser

    Given opened 'Dashboards -> Administration -> Administration' screen using default credentials
    Then 'Administration' screen should be displayed

    When I click 'About' link
    Then 'About Foglight' dialog should be displayed

    When I click 'More...' link
    Then 'More Info' dialog should be displayed

    When receive the information from 'More Info' dialog and save to the test report
    And I close 'More Info' dialog
    And I close 'About Foglight' dialog

    When I click 'Inventory' link
    And receive the following cartridges information and save to the test report
      | FglAM-Adapter      |
#      | WCF_Regression_562 |


