Feature: Run agent builder script on Script console Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to run agent builder script

  @yammy @ui @todo
  Scenario: Run agent builder script on Script Agent Builder Dashboard
    Given opened 'Dashboards -> Administration -> Tooling -> Script Agent Builder' screen using default credentials
    Then 'Script Agent Builder' screen should be displayed

    When I upload file "*work_dir*\resources\Type1_Unix_Script.sh"
    And I click 'Build Script Agent' button
    Then 'Build Agent Confirmation' dialog should be displayed

    When I click 'Submit' button
    Then 'Continue to Agent Status' dialog should be displayed

    When I click 'Close' button
