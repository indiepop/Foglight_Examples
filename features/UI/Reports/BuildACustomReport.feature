Feature: Build a Custom Report
  In order to make sure whether Build a Custom Report successed
  As a Administration
  I want to Build a Custom Report

  @Ellen @ui
  Scenario:Build a Custom Report
    Given opened 'Dashboards -> Reports' screen using default credentials
    Then 'Reports' screen should be displayed

    When I click 'Build a Custom Report' link
    Then 'Create Report' dialog should be displayed
    And wait 1 seconds
    When I click 'Finish' button
    And wait 2 seconds
    Then 'Add view' dialog should be displayed

    When I click '» Next' button
    And wait 1 seconds
    And I navigate 'Advanced Operator -> Service Level Summary Iterator for Report' in 'Add view' dialog tree grid
    And wait 2 seconds
    And I click 'Finish' button
    Then 'My Report' screen should be displayed

#  @Ellen @ui @todo

#  Scenario:Deprecated a exist Report
#    Given opened 'Dashboards -> Configuration -> Definitions' screen using default credentials
#    And I navigate to 'Alarms -> Report' in 'Definitions' tree
#    And I click rows in the 1st grid which contain next values:
#      | Name          |
#      | Alarms Report |
#    And I click 'Edit' button
#  Can't pass the following steps
#    And I click 'Deprecated' checkbox
#
#  And wait 2 seconds
#  And I click 'save' button
#  And opened 'Dashboards -> Reports' screen
#  Then 'Reports' screen should be displayed
#  And I click 'Run a Report' link
#  Then 'Run Report' dialog should be displayed
#  Then 'Run Report' dialog grid should not contain next rows:
#  |Alarms Report|

