Feature: automation for Bean Inputs->Event Form

  @jacin @wcf
  Scenario: Test Event Form
    Given opened 'Dashboards->WCF Regression->Bean Inputs->560->Event Form->Event Form' screen using default credentials
    Then 'Event Form' screen should be displayed

    When I fill 'Event Form' screen with next values:
      | Integer | 10.02 |
    And 'warning.png' icon should be displayed

  #  Then wait 1 seconds
  #
  #  When I fill 'Event Form' screen with next values:
  #    | Double | 10.0215 |
  #  And 'warning.png' icon should be displayed
    When I refresh the browser
    And I fill 'Event Form' screen with next values:
      | Name    | something |
      | Integer | 10        |
      #    | Double  | 10.5      |
      | Flag    | true      |
    And I click on the 4th radio after 'Severity' text
    And I type 'something for textarea' into textarea
    And I click the 'Saved' button
    Then 'Event Info Grid' dialog should be displayed


