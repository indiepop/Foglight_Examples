Feature: automation for Spinner

  @alex @wcf
  Scenario: Test Spinner
    Given opened 'Dashboards -> WCF Regression -> Metric Indicators -> Spinner -> 550 -> Spinners (grid)' screen using default credentials

    When I click on the 2st radio after 'Label' text
    And wait 2 seconds
    And I click on the 3st radio after 'Label' text
    And wait 2 seconds
    And I click on the 4st radio after 'Label' text
    And wait 2 seconds
    And I click on the 5st radio after 'Label' text
    And wait 2 seconds

    Then I type '80' into 2st input
    And I type '30' into 3st input
    And I type 'new' into 4st input
    And wait 2 seconds

    And I click on the 1st radio after 'Label' text
    And wait 2 seconds

    And I close browser