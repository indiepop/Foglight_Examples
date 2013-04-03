Feature:  Check Page Title

  @Bella @wcf
  Scenario: Check Page Title
    Given opened 'Dashboards -> WCF Regression -> Others -> Page Title -> 520 -> Page Title 1' screen using default credentials

   And 'service16-dark.png' icon should be displayed
   Then 'Page Title 1 - WCF Regression Dashboards Suite' message should be displayed