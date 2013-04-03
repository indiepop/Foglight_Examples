Feature: Automation for Flow types

  @alex @wcf
  Scenario: Test Flow types (grid)
    Given opened 'Dashboards->WCF Regression->Flow types->550->Flow types (grid)' screen using default credentials
    Then 'Flow types (grid)' screen should be displayed

    When  I click 'Dialog popup (yammy_win2k364)' link
    Then 'yammy_win2k364' dialog should be displayed
    Then I close 'yammy_win2k364' dialog

    When  I click 'Modal dialog (yammy_win2k364)' link
    Then 'yammy_win2k364' dialog should be displayed
    Then I close 'yammy_win2k364' dialog

    When  I click 'Transient popup (yammy_win2k364)' link

    When  I click the 2st 'CPUs/utilization' link
    Then I click 'Cancel' button

#    Then I select 'jacin01_win2003.prod.quest.corp' in the 1st '[unnamed]' field
#
#    And wait 2 seconds
#    When  I click the 2st 'CPUs/utilization' link
#    Then 'Dialog' dialog should be displayed
#    Then I click 'Show the chart' button
#    Then I close 'Time plot chart' dialog

    And I click 'Go to www.quest.com' link

    And I close browser

