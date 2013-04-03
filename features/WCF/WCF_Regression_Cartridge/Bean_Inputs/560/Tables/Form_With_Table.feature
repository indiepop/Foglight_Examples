Feature: automation for Bean Inputs->Tables

  @jacin
  Scenario: Test Tables
    Given opened 'Dashboards->WCF Regression->Bean Inputs->560->Tables->form with table' screen using default credentials
    Then 'form with table' screen should be displayed

    When I click 'Null' link
    And I click rows in the 1st grid in '[unnamed]' popup which contain next values:
      | Name                            |
      | yammy_win2k364 |

    When I click 'Null' link
    And I click rows in the 1st grid in '[unnamed]' popup which contain next values:
      | Name          |
      | yammy_win2k364 |

    Then I click the 'Save' button
    And 'Info Grid' dialog should be displayed

    And wait 5 seconds
