Feature: Run a Report
  In order to make sure whether run a report successed
  As a Administration
  I want to run a report

 @Ellen @ui
 Scenario:Run a Report
  Given opened 'Dashboards -> Reports' screen using default credentials
  Then 'Reports' screen should be displayed
  When I click 'Run a Report' link
  Then 'Run Report' dialog should be displayed
  When I click in radio in 'Run Report' dialog grid which contain next values:
     |Template|
     |Agent Properties Report|
  And wait 1 seconds
  And I click 'Next' button
  And wait 1 seconds
  And I click 'Next' button
  And wait 1 seconds
  And I fill 'Run Report' dialog with next values:
   |Name|test|
  And I click 'Next' button
  And wait 1 seconds
  And I click 'Finish' button
  And wait 10 seconds
  And opened 'Dashboards -> Reports' screen
  And I click 'Manage Reports' link
  Then 'Manage Reports' screen should be displayed
  When I check rows on 2st grid in 'Manage Reports' screen which contain next values:
     | Name | Template |
     | test | Agent Properties Report |
  And wait 2 seconds
