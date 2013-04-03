Feature: Performance overview on Management Server Dashboard
  In order to make sure whether create threshold successed
  As a Administration
  I want to overview performance

  @yammy @ui @todo
  Scenario: Overview performance on Management Server Dashboard
    Given opened 'Dashboards -> Management Server -> Diagnostic -> Performance' screen using default credentials
    Then 'Performance Overview' screen should be displayed