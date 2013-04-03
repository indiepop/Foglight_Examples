Feature: Create Support Bundles on Manage Support Bundles Dashboard
  In order to make sure whether add support bundles successed
  As a Administration
  I want to create support bundles

  Background: go to the same screen
    Given opened 'Dashboards -> Administration -> Setup & Support -> Manage Support Bundles' screen using default credentials
    Then 'Manage Support Bundles' screen should be displayed

  @yammy @ui

  Scenario: Creating support bundles on manage support bundle Dashboard
    When I click 'Create Bundle' button
    Then 'Create Bundle' dialog should be displayed

    When I fill 'Create Bundle' dialog with next values:
      | Description: | test |
    And I click 'OK' button
    Then 'Support Bundle Generated' dialog should be displayed in 600 seconds

  @yammy @ui

  Scenario: Deleting support bundles on manage support bundle Dashboard
    When I check rows on 'Manage Support Bundles' grid which contain next values:
      | Name                  |
      | [fuzzy]support_bundle |
    And I click 'Delete Bundles' button
    And wait 3 seconds
    Then 'Confirm Delete Support Bundle' dialog should be displayed

    When I click 'OK' button
    And wait 5 seconds
    Then 'Manage Support Bundles' screen grid should not contain next rows:
      | support_bundle | test |

