Feature: Automation for Containers -> Row Layout

  @jacin @wcf
  Scenario: Test Row Layout
    Given opened 'Dashboards->WCF Regression->Containers->Row Layout->520->Row Layout 1' screen using default credentials
    Then 'Row Layout 1' screen should be displayed
    And 'Time Plot Chart 1 - Single Metric Parent' panel should be displayed
    And 'Row-Oriented Table 1' panel should be displayed

    Then I click customize in 'Row-Oriented Table 1' panel grid
    And I click rows in the 1st grid in '[unnamed]' popup which contain next values:
      | Show columns    |
      | Collection Time |
    And I click the 'Apply' button

    Then I click the toolbar 'Select-All' button in 'Row-Oriented Table 1' panel grid
    And  I click the toolbar 'Show Select' button in 'Row-Oriented Table 1' panel grid

    Then 'Row-Oriented Table 2 - List of MetricValues' Dialog should be displayed

    Then I close 'Row-Oriented Table 2 - List of MetricValues' dialog

    Then I click the toolbar 'Unselect-All' button in 'Row-Oriented Table 1' panel grid
    And  I click the toolbar 'Show Select' button in 'Row-Oriented Table 1' panel grid

    Then 'Row-Oriented Table 2 - List of MetricValues' Dialog should be displayed
    Then 'Row-Oriented Table 2 - List of MetricValues' popup grid should contain 'There Is No Data To Display'

    And wait 3 seconds