Feature: automation for Wizard

  @alex @wcf
  Scenario: Test Wizard
    Given opened 'Dashboards -> WCF Regression -> Containers -> Wizard -> 524 -> Grid for Wizard' screen using default credentials
    Then I click 'Click here to customize the chart' button

    When I fill 'Wizard: Time Plot Chart configuration' dialog with next values:
      | Type the name here | John |
    And I click the 'Next' button
    Then I click the cell in the 1st column in 'Step 2: Select a host' grid which contain next values:
      | Name          |
      | yammy_win2k364 |

    When I click the 'Next' button
    And I navigate '	yammy_win2k364 (Host)' in 'Step 3: Select metrics of yammy_win2k364' tree grid
    And wait 30 seconds
    And  I click the cell in the 1st column in 'Step 3: Select metrics of yammy_win2k364' tree grid which contain next values:
      | Metric name          |
      | numProcesses (count) |
    And I click the 'Next' button
    And wait 2 seconds
    And I click the 'Finish' button

    And I close browser

