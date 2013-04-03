Feature: Check Label 2

  @Bella @wcf
  Scenario: Check Label 2
  Given opened 'Dashboards -> WCF Regression -> Others -> Label -> 520 -> Label 2 - String Template with Icon' screen using default credentials

  Then 'service16-dark.png' icon should be displayed
  And 'Icon for Topology Object' message should be displayed