Feature: Check iFrame

  @Bella @wcf
  Scenario: Check iFrame
      Given opened 'Dashboards -> WCF Regression -> Others -> iFrame -> 520 -> iFrame 1 - External URL (Quest.com)' screen using default credentials

      Then 'Showing URL: ' message should be displayed
      And 'http://www.quest.com/' message should be displayed