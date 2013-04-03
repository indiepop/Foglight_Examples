Feature: automation for Charts And Chart->High/Low Bar Chart

  @jacin @wcf
  Scenario: Test High/Low Bar Chart
    Given opened 'Dashboards->WCF Regression->Charts and Gauges->High/Low Bar Chart->550->High/Low Bar Chart (grid)' screen using default credentials
    Then 'High/Low Bar Chart (grid)' screen should be displayed

    Then I navigate 'yammy_win2k364' in 'High/Low Bar Chart (grid)' screen tree grid
#    And I click the cell in the 1th column in 'High/Low Bar Chart (grid)' grid which contain next values:
#      | Metric selector        |
#      | runQueueLength (count) |
#    And wait 3 seconds

#    Then I navigate 'jacin01_win2003.prod.quest.corp' in 'High/Low Bar Chart (grid)' screen tree grid
#    And I click the cell in the 1th column in 'High/Low Bar Chart (grid)' grid which contain next values:
#      | Metric selector  |
#      | interrupts (c/s) |
#    And wait 3 seconds