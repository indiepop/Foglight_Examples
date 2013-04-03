Feature: Add monitored host on Hosts Dashboard
  In order to collect data
  As a Administration
  I want to add monitored host

  @yammy @ui
  Scenario: Add monitored host on Hosts Dashboard
    Given opened 'Dashboards -> Hosts -> Hosts' screen using default credentials
    Then 'Monitored Hosts Only' screen should be displayed

    When I click 'Add Host' button
    Then 'Add Monitored Host' dialog should be displayed in 100 seconds

    When I click on the 2nd radio after 'Host and Agent Manager' text
    Then 'The ip address of the host you would like to monitor.' message should be displayed
    When I type '10.30.149.160' into 1st input in 'Add Monitored Host' dialog

    And wait 10 seconds
    And I click 'Next' button in 'Add Monitored Host' dialog
    Then 'Agent Properties' message should be displayed

    When I click 'Next' button in 'Add Monitored Host' dialog
    Then 'Credential Verification' message should be displayed

    When I click 'Next' button in 'Add Monitored Host' dialog
    Then 'Summary' message should be displayed

    When I click 'Finish' button in 'Add Monitored Host' dialog
    Then 'Agent Creation Successful' dialog should be displayed in 100 seconds