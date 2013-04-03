Feature: Add Topology Type on Date Dashboard
  In order to make sure whether add topology type successed
  As a Administration
  I want to add topology type

  @yammy @ui
  Scenario: Adding topology type on Data Dashboard
    Given opened 'Dashboards -> Administration -> Data -> Add Topology Type' screen using default credentials
    Then 'Add Topology Type' screen should be displayed

    When I upload file "*work_dir*\resources\movie.xml" in 'Import From File' panel
    And I click 'Import' button
    Then 'Successful' dialog should be displayed in 100 seconds

    When I click 'Close' button
    And opened 'Dashboards -> Administration -> Tooling -> Script Console' screen
    Then 'Script Console' screen should be displayed

    When I type 'Movie' into 1st input in 'Script Console' screen
    And I select 'Movie' item in popup combobox
    And wait 5 seconds

