Feature: View blackouts by object on Blackouts Dashboard
  In order to make sure those screen works fine
  As a Administration
  I want to do some execute

 Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Setup & Support -> Blackouts' screen using default credentials
    Then 'Blackouts' screen should be displayed

  @yammy @ui
  Scenario: View Blackouts by Object
    When I click 'View Blackouts by Object' link
    Then 'View Blackouts By Object' screen should be displayed
    
