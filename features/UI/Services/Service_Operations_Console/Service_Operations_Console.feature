Feature: Service Operation Console to display services
  As a Administrator
  I want to monitor created services

  Background: Go to Service Operations Console dashboard
    Given opened 'Dashboards -> Services -> Service Operations Console' screen using default credentials
    Then 'Service Operations Console' screen should be displayed

  @linda @ui

  Scenario: Select and Unselect services and tiers to monitor
    When I click 'Select services and tiers to monitor' link on 'Service Operations Console' screen
    Then 'Select services and tiers to monitor' dialog should be displayed

    When I fill 'Select services and tiers to monitor' dialog with next values:
      | Enable the display of the status of the nested services[right] | on |
    And I fill 'Select services and tiers to monitor' dialog with next values:
      | Test[right] | on |
    And wait 2 seconds
    And I click 'Tier Selector' tab in popup
    And I click 'Select All' button in 'Select services and tiers to monitor' dialog
    And wait 2 seconds
    And I click 'Apply' button

  @linda @ui

  Scenario: Service operations main views
    When I click the cell in the 1st column in 'Service Operations Console' screen grid which contain next values:
      | Name |
      | Test |
    And wait 2 seconds
    And I click 'Alarms' tab
    Then ' Outstanding Alarm(s) for Test' message should be displayed

    When I click ' Service Level Agreement(s)' tab
    And I click '0 Service(s) Impacted' tab
    And I click 'Service Contents' tab
    And I click 'Service Dependencies' tab
    And I click 'Advanced Service Visualization' tab
    And I click 'table_explore_blue_app.png' icon
    Then 'Service Details: ' screen should be displayed

  @linda @ui

  Scenario:Unselect services and Tiers to monitor
    When I click 'Select services and tiers to monitor' link on 'Service Operations Console' screen
    Then 'Select services and tiers to monitor' dialog should be displayed

    When I click 'Unselect All' button in 'Select services and tiers to monitor' dialog
    And wait 2 seconds
    And I click 'Tier Selector' tab in popup
    And I click 'Unselect All' button in 'Select services and tiers to monitor' dialog
    And wait 2 seconds
    And I click 'Apply' button












