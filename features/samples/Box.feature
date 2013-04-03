Feature: Testing Box,Panel,Dialog Component
  In order to test the Box,Panel,Dialog component
  As a component developer
  I want make sure the component works properly

  @test
  Scenario: Test maximize dialog
    Given opened 'Dashboards->Management Server->Servers->Management Server View' screen using default credentials
    Then 'Management Server View' screen should be displayed
    And 'Rule Service' panel should be displayed

    When I click chart in 'Rule Service' panel
    Then 'Metrics' dialog should be displayed

    When I maximize 'Metrics' dialog
    Then 'restore' icon should be displayed in 'Metrics' dialog

  @test
  Scenario: Test restore dialog
    Given opened 'Dashboards->Management Server->Servers->Management Server View' screen using default credentials
    Then 'Management Server View' screen should be displayed
    And 'Rule Service' panel should be displayed

    When I click chart in 'Rule Service' panel
    Then 'Metrics' dialog should be displayed

    When I maximize 'Metrics' dialog
    Then 'restore' icon should be displayed in 'Metrics' dialog

    When I restore 'Metrics' dialog
    Then 'max' icon should be displayed in 'Metrics' dialog

  @test
  Scenario: Test close dialog
    Given opened 'Dashboards->Management Server->Servers->Management Server View' screen using default credentials
    Then 'Management Server View' screen should be displayed
    And 'Rule Service' panel should be displayed

    When I click chart in 'Rule Service' panel
    Then 'Metrics' dialog should be displayed

    When I close 'Metrics' dialog
    Then 'Metrics' dialog should be disappear

  @test
  Scenario: Test help in panel
    Given opened 'Dashboards->Management Server->Servers->Management Server View' screen using default credentials
    Then 'Management Server View' screen should be displayed
    And 'Rule Service' panel should be displayed

    When I help 'Rule Service' panel
    Then 'Rule Service View' popup should be displayed

  @test
  Scenario: Test collapse and expand panel
    Given opened 'Dashboards->Management Server->Servers->Persistence Handler Overview' screen using default credentials
    Then 'Persistence Handler Overview' screen should be displayed
    And 'Number of rows in table' panel should be displayed

    When I collapse 'Number of rows in table' panel
    Then 'expand' icon should be displayed in 'Number of rows in table' panel

    When I expand 'Number of rows in table' panel
    Then 'collapse' icon should be displayed in 'Number of rows in table' panel