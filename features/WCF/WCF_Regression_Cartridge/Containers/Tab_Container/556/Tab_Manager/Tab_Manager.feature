Feature: Automation for Containers -> Tab Manager

  @jacin @wcf
  Scenario: Test Tab Manager
    Given opened 'Dashboards->WCF Regression->Containers->Tab Container->556->Tab Manager->Tab Manager' screen using default credentials
    Then 'Tab Manager' screen should be displayed

#    When I click the 1st 'My View' tab
#    Then 'Topology Changes from Topology Object List' panel should be displayed
#    And 'Monitored Hosts Only' panel should be displayed

    When I click the 1st 'Active Hosts Summary' tab
    And I type '20' into 2st input
    Then 'warning.png' icon should be displayed

    When I type '1' into 2st input
    And I click the 'Apply' button

    Then I click the 1st 'Agent Status' tab
