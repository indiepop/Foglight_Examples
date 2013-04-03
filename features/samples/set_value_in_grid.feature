Feature: test

  Scenario: test set value in grid
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed
    When I click 'Password Policy Settings' link
    Then 'Password Settings' screen should be displayed
    When I set value '100' in the 2rd column in 'Password Settings' tree grid which contain next values:
      | Value |
      | 600   |
    And I click 'Save Changes' button
    And wait 5 seconds