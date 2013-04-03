Feature: Run a Schedule Report
  In order to make sure whether Run a Schedule Report successed
  As a Administration
  I want to Run a Schedule Report

 @Ellen @ui
 Scenario:Run a Schedule Report
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
   |Name                  | testScheduleReport|
   |Schedule This Report  | on                |
  And wait 2 seconds
  And I click 'Next' button
  When I click in radio in 'Run Report' dialog grid which contain next values:
    |Schedule|
    |Hourly|
  And wait 2 seconds
  And I click 'Next' button
  And I click 'Finish' button
  And wait 10 seconds
  And opened 'Dashboards -> Reports' screen
  And I click 'Manage Reports' link
  Then 'Manage Reports' screen should be displayed
  When I check rows on 1st grid in 'Manage Reports' screen which contain next values:
     | Name | Template |
     | testScheduleReport | Agent Properties Report |
  And wait 2 seconds