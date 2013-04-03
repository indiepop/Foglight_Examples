Feature: Add os monitor on Infrastructure Dashboard
  In order to mark sure this function works fine
  As a Administration
  I want to add os monitor

  @yammy @ui
  Scenario: Add os monitor on Infrastructure Dashboard
    Given opened 'Dashboards -> Infrastructure' screen using default credentials
    Then 'Infrastructure Environment' screen should be displayed

    When I click 'Add OS Monitor' link
    Then 'No Agent Managers' dialog should be displayed

    When I click 'Go to Agent Hosts' button
    Then 'Agent Host' screen should be displayed
