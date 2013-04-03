Feature: Analyse log on Management Server Dashboard
  In order to make sure whether create threshold successed
  As a Administration
  I want to analyse log

  @yammy @ui @todo
  Scenario: Analyse log on Management Server Dashboard
    Given opened 'Dashboards -> Management Server -> Diagnostic -> Log Analyzer' screen using default credentials
    Then 'Log Overview' screen should be displayed