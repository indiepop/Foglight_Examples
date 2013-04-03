Feature: Service Levels Information
  As an Administration
 I want to go through Service Levels components to view service info.

 Background: Go to Service Levels dashboard
   Given opened 'Dashboards -> Services -> Service Levels' screen using default credentials
   Then 'Service Levels' screen should be displayed

 @linda @ui
 Scenario: View Service Levels Information
   When I click 'Service Level Selector' link
   Then 'Service Level Selector' dialog should be displayed
   And I click the cell in the 1st column in 'Service Level Selector' dialog grid which contain next values:
   |Service Level|
   |Test         |
   Then I close 'Service Level Selector' dialog
   When I click the cell in the 1st column in 'Service Levels' screen grid which contain next values:
     | Name |
     | All  |
   Then 'All' popup should be displayed
   And I select 'Monitored Service' in 'All' popup
   Then 'All Summary' dialog should be displayed
   And I close 'Test Summary' dialog
   And I click 'All (FSMCategory)' link in 'Service Levels' screen
   Then 'All Summary' dialog should be displayed
   And I click 'Default Service Breakdown' link in 'Test Summary' dialog
   Then 'Health Contributors' screen should be displayed
   And I click ' Service Levels' link in 'Health Contributors' screen
   Then 'Test Summary' dialog should be displayed
   And I click 'Edit Service "Test"' link in 'Test Summary' dialog
   Then 'Test' screen should be displayed


