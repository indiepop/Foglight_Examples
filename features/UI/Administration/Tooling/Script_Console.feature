Feature: Run script on Script console Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to add and delete a script

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Tooling -> Script Console' screen using default credentials
    Then 'Script Console' screen should be displayed

  @yammy @ui
  Scenario: Adding script on Script console Dashboard
    When I click 'Scripts' tab
    And I click 'Add' button
    Then 'Run Script' dialog should be displayed

    When I fill 'Run Script' dialog with next values:
      | Name | test |
    And I type 'agents_restore();' into 'Enter Script Text:' textarea
    And I click 'Run' button
    Then 'Complete!' message should be displayed

    When I click 'Save' button in 'Run Script' dialog
    And I click 'Cancel' button in 'Run Script' dialog
    And wait 5 seconds
    And I refresh the browser
    Then the 2nd grid in 'Script Console' screen should contain next rows:
      | Script Name |
      | test        |


  @yammy @ui
  Scenario: Select all script on Script console Dashboard
    When I click 'Select All' button
    Then Rows in the 2th grid should be select which contain next values:
      |            | Script Name |
      | [selected] | test        |

    When I click 'Remove Selected' button
    Then 'Delete Script Confirmation Dialog' dialog should be displayed

    When I click 'OK' button
    Then the 2nd grid in 'Script Console' screen should not contain next rows:
      | test |

