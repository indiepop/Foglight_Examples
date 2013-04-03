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
  And I fill 'Select services and tiers to monitor' dialog with next values:
    | Enable the display of the status of the nested services[right] | on |
  And I fill 'Select services and tiers to monitor' dialog with next values:
    | Test[right] | on |
  And wait 2 seconds
  And I click 'Tier Selector' tab in popup
  And I click 'Select All' button in 'Select services and tiers to monitor' dialog
  And wait 2 seconds
  And I click 'Apply' button

@linda @ui
Scenario:Unselect services and Tiers to monitor
  Then I click 'Select services and tiers to monitor' link on 'Service Operations Console' screen
  Then 'Select services and tiers to monitor' dialog should be displayed
  And I click 'Unselect All' button in 'Select services and tiers to monitor' dialog
  And wait 2 seconds
  Then I click 'Tier Selector' tab in popup
  And I click 'Unselect All' button in 'Select services and tiers to monitor' dialog
  And wait 2 seconds
  And I click 'Apply' button



