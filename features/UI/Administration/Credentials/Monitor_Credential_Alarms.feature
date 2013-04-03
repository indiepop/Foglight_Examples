Feature: Monitor Credential Alarms
  In order to Monitor Credential Alarms
  As a system administrator
  I should have a existing credential

  @mark @TODO
  Scenario: Monitor Credential Alarms
    Given opened 'Dashboards->Administration->Credentials' screen using default credentials
    Then 'Credentials' screen should be displayed
    When I click 'Monitor Credential Alarms' link
    Then 'Monitor Credential Alarms' screen should be displayed


  Scenario: Alarm Filter
    When I click 'Alarm Filter ' link
    Then 'Alarm Filter [ Unset ]' dialog should be displayed in 400 seconds
    When I click on the 1nd radio after 'Current' text in 'Alarm Filter [ Unset ]' dialog
  #  When I click 'True' checkbox in 'Alarm Filter [ Unset ]' dialog
    And I click 'Update' button
    And I close 'Alarm Filter [ Unset ]' dialog

  Scenario: customize
    When I click 'edit.png' icon in 'Monitor Credential Alarms' screen
    Then '[unnamed]' popup should be displayed
    When I check rows on '[unnamed]' popup grid which contain next values:
      | Show columns |
      | Instance         |
    And I click 'Apply' button
    Then 'Instance' message should be displayed