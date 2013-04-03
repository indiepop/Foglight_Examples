Feature: Check Row-OrientedTable1AutoWidth

  @Bella @wcf
  Scenario:  Check Row-OrientedTable1AutoWidth
    Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Row-Oriented Table -> 520 -> Row-Oriented Table 1 - auto width' screen using default credentials

    When I click 'Select-All' button
    And I click 'Show Selected' button
    Then 'Row-Oriented Table 2 - List of Alarms' dialog should be displayed
    And I close 'Row-Oriented Table 2 - List of Alarms' dialog


    When I click 'Unselect-All' button
    And I click 'Show Selected' button
    Then 'Row-Oriented Table 2 - List of Alarms' dialog should be displayed
    Then 'Row-Oriented Table 2 - List of Alarms' dialog grid should contain 'There Is No Data To Display'
    And I close 'Row-Oriented Table 2 - List of Alarms' dialog


  #    When I click the cell in the 1st column in 'Row-Oriented Table 1 - auto width' grid which contain next values:
  #       | Index |
  #       | 1 |
  #    And I click 'Show Selected' button
  #    Then 'Row-Oriented Table 2 - List of Alarms' dialog grid should contain 1 rows

    When I click 'Visit Quest.com' button

    And I close browser

