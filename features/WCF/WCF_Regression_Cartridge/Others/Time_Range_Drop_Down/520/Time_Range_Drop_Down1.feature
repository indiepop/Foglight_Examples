Feature: Check Time Range Drop-Down

  @Bella @wcf
  Scenario: Check Time Range Drop-Down
    Given opened 'Dashboards -> WCF Regression -> Others -> Time Range Drop-Down -> 520 -> Time Range Drop-Down 1' screen using default credentials

    When I click 'Last year' link
    And I click rows in the 3th grid in '[unnamed]' popup which contain next values:
      | Last 3 hours |
    Then I click the 'Click to Apply' button