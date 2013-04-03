Feature: automation for Containers->Dialog(Form)

  @jacin @wcf
  Scenario: Test Dialog Form
    Given opened 'Dashboards->WCF Regression->Containers->Dialog (Form)->523->Form' screen using default credentials
    Then 'Form' screen should be displayed

    When I select 'yammy_win2k364' in the 1st 'Select a host' field
#    And I select 'jacin01_win2003.prod.quest.corp' in the 1st 'Select a host' field
#    And  I click the cell in the 2st column in 'Row Table' grid which contain next values:
#      | Name |
#      | Windows_System_Windows_System@yammy_win2k364 |
    And I type 'something test' into 2st input

    When I click the 'Submit to pop-up' button
    And 'Submit results' dialog should be displayed
    And 'Submit results' dialog grid should contain 'yammy_win2k364'
    And 'Submit results' dialog grid should contain 'something test'
    Then I close 'Submit results' dialog

    When I click the 'Submit to new page' button
    Then 'Submit results' screen should be displayed
    And 'Submit results' screen grid should contain 'yammy_win2k364'
    And 'Submit results' screen grid should contain 'something test'
