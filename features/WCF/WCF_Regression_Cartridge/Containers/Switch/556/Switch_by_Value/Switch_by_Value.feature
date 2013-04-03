Feature: Automation for Containers -> Switch by Value

  @alex @wcf
  Scenario: Test Switch by Value
    Given opened 'Dashboards->WCF Regression->Containers->Switch->556->Switch by Value->Switch by Value' screen using default credentials
    Then 'Switch by Value' screen should be displayed

    Then I select 'summary' in the 1st '[unnamed]' field
    And 'Label summary' panel should be displayed

    And wait 2 seconds

    Then I select 'monitor' in the 1st '[unnamed]' field
    And 'Label monitor' panel should be displayed

    And I close browser
