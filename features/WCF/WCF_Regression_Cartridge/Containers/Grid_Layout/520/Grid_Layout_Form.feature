Feature: automation for Inputs

   @jacin @wcf
Scenario: Test Inputs
    Given opened 'Dashboards->WCF Regression->Containers->Grid Layout->520->Grid Layout - Form' screen using default credentials
    Then 'Grid Layout - Form' screen should be displayed

    Then I click the 1st 'See WCF Regression - Inputs. Click here.' link

    Then 'Grid Layout - Inputs' screen should be displayed

    Then I fill 'Grid Layout - Inputs' screen with next values:
    | Check Box 1 | on |
    | [-100.0,100.0] | 10 |
    | Type (20 char max): | something |

    And I click the 1st 'Apply' button
    And I click the 3rd 'Apply' button

    Then I select 'Schedule: Weekends' in 'Drop-Down List 1 - Schedules' field
    And I click the 'Click to Apply' button

    Then I type 'something for textarea' into textarea
    And I click the 2st 'Apply' button

    Then I click on the 2st radio after 'Schedules' text

    Then I click the 'Click here to Submit' button

    Then wait 3 seconds

    And I close browser


