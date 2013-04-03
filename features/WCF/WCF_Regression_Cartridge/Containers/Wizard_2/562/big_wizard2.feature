Feature: automation for wizard2

  @alex @wcf
  Scenario: Test wizard2
    Given opened 'Dashboards -> WCF Regression -> Containers -> Wizard 2 -> 562 -> big wizard2' screen using default credentials
    Then I fill 'big wizard2' screen with next values:
      | What is your name? | John |

    When I click on the 1st radio after 'who are you card' text
    And wait 2 seconds
    And I click 'Next' button

    And I click 'Finish' button
    And  I close 'Commit Result' dialog

    And I click 'Cancel' button
    And wait 2 seconds

    And I click on the 2nd radio after 'who are you card' text
    And I fill 'big wizard2' screen with next values:
      | What is your name? | Bob |
    And wait 2 seconds

    And I click 'Next' button
    And wait 2 seconds
    And I click 'Next' button
    And wait 2 seconds

    And I click 'Continue' button
    And wait 2 seconds

    And I close browser