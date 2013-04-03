Feature: automation for Bean Inputs->Combobox

  @jacin @wcf
  Scenario: Test ComboDialog
    Given opened 'Dashboards->WCF Regression->Bean Inputs->560->combobox->ComboDialog' screen using default credentials
    Then 'ComboDialog' screen should be displayed

    When I type 'Something test' into 2st input
    And I click 'Design' tab
    And I click the 'submit' button
    Then 'ComboDialog' screen grid should not contain 'Something test'

    Given opened 'Dashboards->WCF Regression->Bean Inputs->560->Event Form->Event Form' screen
    And opened 'Dashboards->WCF Regression->Bean Inputs->560->combobox->ComboDialog' screen
    When I type 'helloWCF-1' into 3st input
    And I click 'Design' tab
    And I type 'helloWCF-2' into 4st input
    And I click 'Design' tab

    When I fill 'ComboDialog' screen with next values:
      | is disabled | on |
    And I click the 'submit' button
    Then 'ComboDialog' screen grid should not contain 'new Value'

    When I fill 'ComboDialog' screen with next values:
      | is disabled | false |
    And I click the 'submit' button
    Then 'ComboDialog' screen grid should not contain 'new Value(helloWCF-1)'
    And 'ComboDialog' screen grid should not contain 'new Value(helloWCF-2)'