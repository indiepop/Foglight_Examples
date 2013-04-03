Feature: View blackouts by agent on Blackouts Dashboard
  In order to make sure those screen works fine
  As a Administration
  I want to do some execute

 Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Setup & Support -> Blackouts' screen using default credentials
    Then 'Blackouts' screen should be displayed

  @yammy @ui
  Scenario: View Blackouts by agent
    When I click 'View Blackouts by Agent' link
    Then 'View Blackouts By Agent' screen should be displayed
#    And 'View Blackouts By Agent' screen tree grid should contain next rows:
#      | Name             |
#      | Windows_IC_Agent |