Feature: Automation for Reporting

  @alex @wcf
  Scenario: Test Report 1
    Given opened 'Dashboards->WCF Regression->Reporting->520->Report 1' screen using default credentials
    Then 'Report 1' screen should be displayed

    And I click 'Select-All' button
    And wait 2 seconds

    And I click 'Unselect-All' button
    And wait 2 seconds

    When I click the cell in the 1st column in 'Report 1' grid which contain next values:
      | Index |
      | 1     |
      | 2     |
      | 3     |
    And I click 'Show Selected' button
    Then 'Row-Oriented Table 2 - List of MetricValues' dialog grid should contain 3 rows

    And I click 'Visit Quest.com' button

    And I close browser





