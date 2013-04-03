Feature: Verification foglight module
  In order to make sure this function works fine
  As a Administration
  I want to search foglight module

  @yammy @ui @todo
  Scenario: Search foglight module on dashboard development dashboard
#    Given I start monitoring log on machine 'FMS'
    Given opened 'Dashboards -> Dashboard Development' screen using default credentials
    Then 'Dashboard Development' screen should be displayed

    When I click 'Schema Browser' action
    Then 'Schema Browser' screen should be displayed
#    And machine 'FMS' should not contain ERROR,FATAL in log

#    When I select 'Host' in the 2nd '[unnamed]' field
#    And 'Local Properties' grid should contain 'n/a'
