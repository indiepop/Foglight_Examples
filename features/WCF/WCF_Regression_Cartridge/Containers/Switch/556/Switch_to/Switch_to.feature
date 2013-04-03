Feature: Automation for Containers -> Switch to

  @jacin @wcf
  Scenario: Test Switch to
    Given opened 'Dashboards->WCF Regression->Containers->Switch->556->Switch to->Switch to' screen using default credentials
    Then 'Switch to' screen should be displayed

    Then I select '2' in the 1st '[unnamed]' field
    And 'Monitored Hosts Only' panel should be displayed

    Then I select 'Unmonitored Hosts Only' in the 1st 'Filter By Activity: ' field
    And 'Unmonitored Hosts Only' panel should be displayed

    Then I select '1' in the 1st '[unnamed]' field

    Then I select '3' in the 1st '[unnamed]' field

