Feature: Manage host aliasing on Tooling Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to manage host aliasing

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Tooling -> Manage Host Aliasing Rules' screen using default credentials
    Then 'Manage Host Aliasing Rules' screen should be displayed

  @yammy @ui
  Scenario: Create a focused rule for a single host
    When I click 'Add...' button
    Then 'New Merging Rule Introduction' dialog should be displayed

    When I click 'Create a focused rule for a single host' link
    Then 'Create a focused rule for a single host' dialog should be displayed

    When I click 'Select a property...' link
    When I click 'Name' cell in rows on '[unnamed]' popup grid which contain next values:
      | Name |
      | name |
    And wait 3 seconds
    When I click 'Look up...' button
    Then 'Target Host Finder' dialog should be displayed
    And 'yammy-win2k364' message should be displayed

    When I click 'Host Name' cell in rows on 'Target Host Finder' dialog grid which contain next values:
      | Host Name      |
      | yammy-win2k364 |
    And I click 'Select' button
    And wait 5 seconds
    And I close 'Target Host Finder' dialog
    And I click 'Next' button
    Then 'Specify Source Host' message should be displayed

    When I click 'Look up...' button
    Then 'Host Finder' dialog should be displayed
    And 'yammy-win2k364' message should be displayed

    When I click 'Host Name' cell in rows on 'Host Finder' dialog grid which contain next values:
      | Host Name       |
      | yammy-win2k364 |
    And I click 'Select' button
    And wait 5 seconds
    And I close 'Host Finder' dialog
    And I click 'Next' button
    Then 'Summary' message should be displayed

    When I click 'Finish' button
    Then 'Successful' dialog should be displayed

    When I click 'Ok' button
    And wait 10 seconds
    Then 'Manage Host Aliasing Rules' screen grid should contain next rows:
      | Display Name                                          |
      | Map_host yammy-win2k364 to_host yammy-win2k364_Rule |

  @yammy @ui
  Scenario: Create a broad rule which works with many hosts
    When I click 'Add...' button
    Then 'New Merging Rule Introduction' dialog should be displayed

    When I click 'Create a broad rule which works with many hosts' link
    And I click on the 1st radio after 'Select a Transformation Method' text
    And I click 'Next' button
    Then 'Remove characters from the end of a host name' message should be displayed

    When I type 'z' into 1st input in 'Create a Broad Rule Which Works With Many Hosts' dialog
    And I type 'c' into 2nd input in 'Create a Broad Rule Which Works With Many Hosts' dialog
    And wait 10 seconds
    And I click 'Next' button
    Then 'Summary' message should be displayed

    When I click 'Finish' button
    Then 'Successful' dialog should be displayed

    When I click 'Ok' button
    Then 'Manage Host Aliasing Rules' screen grid should contain next rows:
      | Display Name                     |
      | Remove_Characters_Host_Name_Rule |

  @yammy @ui
  Scenario: Remove characters host name rule
    When I check rows on 'Manage Host Aliasing Rules' screen grid which contain next values:
      | Display Name                     |
      | Remove_Characters_Host_Name_Rule |
    When I click 'Delete' button
    Then 'Confirm Delete' dialog should be displayed
    When I click 'Yes' button
    Then 'Rules Deleted' dialog should be displayed

    When I click 'Ok' button
    Then 'Manage Host Aliasing Rules' screen grid should not contain next rows:
      | Display Name                     |
      | Remove_Characters_Host_Name_Rule |