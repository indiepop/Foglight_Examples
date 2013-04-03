Feature: Check Row-Oriented Table

  @Bella @wcf
  Scenario: Check Row-Oriented Table
    Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Row-Oriented Table -> 520 -> Row-Oriented Table 1' screen using default credentials

    When I click 'Select-All' button
    And I click 'Show Selected' button
    Then 'Row-Oriented Table 2 - List of MetricValues' dialog should be displayed
  #   Then 'Row-Oriented Table 2 - List of MetricValues' dialog grid should contain 22 rows
    And I close 'Row-Oriented Table 2 - List of MetricValues' dialog


    When I click 'Unselect-All' button
    And I click 'Show Selected' button
    Then 'Row-Oriented Table 2 - List of MetricValues' dialog should be displayed
    Then 'Row-Oriented Table 2 - List of MetricValues' dialog grid should contain 'There Is No Data To Display'
    And I close 'Row-Oriented Table 2 - List of MetricValues' dialog


    When I click the cell in the 1st column in 'Row-Oriented Table 1' grid which contain next values:
      | Index |
      | 1     |
      | 2     |
      | 3     |
    And I click 'Show Selected' button
    Then 'Row-Oriented Table 2 - List of MetricValues' dialog grid should contain 3 rows

#    When I click 'Visit Quest.com' button
#    And I close browser
