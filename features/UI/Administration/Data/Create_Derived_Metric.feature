Feature: Create derived metric on Date Dashboard
  In order to make sure whether create derived metric successed
  As a Administration
  I want to create derived metric

  @yammy @ui @todo
  Scenario: Adding derived metric on Data Dashboard
    Given opened 'Dashboards -> Administration -> Data -> Create Derived Metric' screen using default credentials
    Then 'Create Derived Metric' screen should be displayed

    When I go to 1st frame
    And I type 'test' into 1st input
    And I close browser
#    And I click 'Add Calculation' button
#    Then 'Derived Metric Scope:' message should be displayed
#
#    When I select 'Agent' in the 1st '[unnamed]' field
#    And I click 6th 'transparent.gif' icon
#    And wait 5 seconds
#    Then 'Expression Editor' dialog should be displayed
#
#    And I type 'TEST' into 1st textarea
#    And I click 'Next' button
#    And wait 1 seconds
#    And I click 'Add' button
#    And wait 5 seconds
