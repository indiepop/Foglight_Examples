Feature: Manager agents on Management Server Dashboard
  In order to make sure whether create threshold successed
  As a Administration
  I want to manager agents

  @yammy @ui @todo
  Scenario: Manager agents on Management Server Dashboard
    Given opened 'Dashboards -> Management Server -> Diagnostic -> Agent Manager' screen using default credentials
    Then 'Fglam Performance Overview' screen should be displayed