Feature: Automation for Bean Inputs -> Cell Edit Bean Table

  @jacin @wcf
  Scenario: Test Cell Edit Bean Table
    Given go to 'Dashboards->WCF Regression->Bean Inputs->560->Bean Cell Input Tables->Dialog - Cell Edit Bean Table' screen using default credentials
    Then 'Dialog - Cell Edit Bean Table' screen should be displayed
    When you click 'Add row' button
    Then 'Dialog - Cell Edit Bean Table' grid should contain next rows:
      | mystring |
      | mystring |

#    When  I click the cell in the 2st column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | mystring |
#      | mystring |
#    And  I select 'Medium' in '[unnamed]' popup menu
#    And  I click the cell in the 4th column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | mystring |
#      | mystring |
#    Then 'start time dialog' dialog should be displayed
#
#    When I click 'Save' button in 'start time dialog' dialog
    Then  I click the cell in the 8th column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
      | mystring |
      | mystring |
#   And I type 'textarea' into textarea
    And you type 'staf' into textarea
    And wait 5 seconds
    And I click 'Design' tab
#
#    Then I click the cell in the 5th column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | mystring |
#      | textarea |
#    Then 'end time dialog' dialog should be displayed
#    And I click 'Save' button in 'end time dialog' dialog
#
#    Then I set value '10' in the 6st column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | mystring |
#      | textarea |
#
#    Then I set value '25' in the 7st column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | mystring |
#      | textarea |
#
#    Then I set value '50.65' in the 9st column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | mystring |
#      | textarea |
#
#    Then I click the cell in the 11th column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | mystring |
#      | textarea |
#
#    Then I click 'Add row' button
#
#    And  I click 'sizeNoDefault' link
#    And wait 1 seconds
#
#    Then 'Dialog - Cell Edit Bean Table' grid should contain next rows:
#      | mystring |
#      | mystring |
#
#    Then  I click the cell in the 2st column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | mystring |
#      | mystring |
#    And  I select 'Short' in '[unnamed]' popup menu
#
#    Then  I click the cell in the 4th column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | sizeNoDefault |
#      | Short         |
#    Then 'start time dialog' dialog should be displayed
#    And I click 'Save' button in 'start time dialog' dialog
#
#    Then I click the cell in the 5th column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | sizeNoDefault |
#      | Short         |
#    Then 'end time dialog' dialog should be displayed
#    And I click 'Save' button in 'end time dialog' dialog
#
#    Then I set value '12' in the 6st column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | sizeNoDefault |
#      | Short         |
#
#    Then I set value '55' in the 7st column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | sizeNoDefault |
#      | Short         |
#
#    Then  I click the cell in the 8th column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | sizeNoDefault |
#      | Short         |
#    And I type 'second textarea' into textarea
#    And I click 'Design' tab
#
#    Then I set value '20.11' in the 9st column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | sizeNoDefault |
#      | Short         |
#
#    Then I click the cell in the 11th column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | sizeNoDefault |
#      | Short         |
#
#    Then I click the 'Save' button
#    Then I refresh the browser
#    And 'Dialog - Cell Edit Bean Table' grid should contain 4 rows
#
#    Then I click the cell in the 1st column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | sizeNoDefault |
#      | Short         |
#    And 'Dialog - Cell Edit Bean Table' grid should contain 3 rows
#
#    Then I click the cell in the 1st column in 'Dialog - Cell Edit Bean Table' grid which contain next values:
#      | sizeNoDefault |
#      | Medium        |
#    And 'Dialog - Cell Edit Bean Table' grid should contain 'There Is No Data To Display'
#
#    Then I click the 'Save' button
#    Then I refresh the browser
#    And 'Dialog - Cell Edit Bean Table' grid should contain 'There Is No Data To Display'
#
#    And wait 5 seconds