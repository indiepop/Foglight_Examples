Feature: automation for History Table (one metric)

  @alex @wcf
  Scenario: Test History Table (one metric)
    Given opened 'Dashboards -> WCF Regression -> Metric Indicators -> Metric History Table -> 550 -> History Table (one metric)' screen using default credentials

    When I navigate 'yammy_win2k364' in 'History Table (one metric)' tree grid
    Then  I click the cell in the 1st column in 'History Table (one metric)' grid which contain next values:
      | Metric selector       |
      | contextSwitches (c/s) |
  #    When I navigate 'CPUs' in 'History Table (list of metrics)' tree grid
  #    Then  I click the cell in the 1st column in 'History Table (list of metrics)' grid which contain next values:
  #          | Metric selector |
  #          | utilization (%) |

    And wait 3 seconds

    And I close browser
