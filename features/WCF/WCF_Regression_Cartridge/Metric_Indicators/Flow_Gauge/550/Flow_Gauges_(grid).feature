Feature: automation for Flow Gauges

  @alex @wcf
  Scenario: Test Flow Gauges
    Given opened 'Dashboards -> WCF Regression -> Metric Indicators -> Flow Gauge -> 550 -> Flow Gauges (grid)' screen using default credentials
    Then I click on the 2st radio after 'Label' text
    And wait 2 seconds

    When I click on the 3st radio after 'Label' text
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