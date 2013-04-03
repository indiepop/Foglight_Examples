Feature: automation for History Table (list of metrics)

  @alex @wcf
  Scenario: Test History Table (list of metrics)
    Given opened 'Dashboards -> WCF Regression -> Metric Indicators -> Metric History Table -> 550 -> History Table (list of metrics)' screen using default credentials

    When I navigate 'yammy_win2k364' in 'History Table (list of metrics)' tree grid
    Then  I click the cell in the 1st column in 'History Table (list of metrics)' grid which contain next values:
      | Metric selector       |
      | contextSwitches (c/s) |

    And wait 3 seconds

    And I close browser
