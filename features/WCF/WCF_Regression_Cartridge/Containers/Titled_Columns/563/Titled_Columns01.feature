Feature: Automation for Containers -> Tab Manager

  @jacin @wcf
  Scenario: Test Tab Manager
    Given opened 'Dashboards->WCF Regression->Containers->Titled Columns->563->Titled Columns 01' screen using default credentials
    Then 'Titled Columns Simple Example' screen should be displayed

    Then I click the 1st 'Network' link
    And 'Network details on' screen should be displayed
    And 'Intel[R] PRO_1000 MT Network Connection' panel should be displayed
    And 'MS TCP Loopback interface' panel should be displayed

    Then I click 'Titled Columns Simple Example' link
    And wait 3 seconds

    Then I type '20' into 2st input
    And 'warning.png' icon should be displayed

    Then I type '1' into 2st input
    And I click the 'Apply' button