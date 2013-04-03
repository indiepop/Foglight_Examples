Feature: Check Syndication Feed

  @Bella @wcf
  Scenario: Check Syndication Feed
      Given opened 'Dashboards -> WCF Regression -> Others -> Syndication Feed -> 520 -> Syndication Feed 1' screen using default credentials

    Then 'Feed Title: All Outstanding Alarms on' message should be displayed
    And 'Feed Description: All outstanding alarms.' message should be displayed
    Then 'Feed Items' message should be displayed
