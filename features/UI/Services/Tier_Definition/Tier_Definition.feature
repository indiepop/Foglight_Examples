Feature: Configure tiers that can be show or hide in Service Operations Console
  As an Administrator
  I want to select or unselect tiers that show or hide in Service Operations Console

  Background: Go to Tier Definition dashboard
    Given opened 'Dashboards -> Services -> Tier Definition' screen using default credentials
    Then 'Tier Definition' screen should be displayed

  @linda @ui

  Scenario: select one customize Object group
    When I check rows in 'Tier Definition' screen grid which contain next values:
      | Name |
      | Test |
    And wait 2 seconds

    When opened 'Dashboards -> Services -> Service Operations Console' screen
    Then 'Service Operations Console' screen should be displayed

    When I click 'Select services and tiers to monitor' link in 'Service Operations Console' screen
    Then 'Select services and tiers to monitor' dialog should be displayed

    When I click 'Tier Selector' tab
    And I fill 'Select services and tiers to monitor' dialog with next values:
      | Test[right] | on |
    And I click 'Apply' button
    Then 'Service Operations Console' screen grid should contain next rows:
      | Test |



