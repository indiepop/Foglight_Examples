Feature: Verification screen on Blackouts Dashboard
  In order to make sure those screen works fine
  As a Administration
  I want to do some execute

  Background: Go to the same screen
    Given opened 'Dashboards -> Administration -> Setup & Support -> Blackouts' screen using default credentials
    Then 'Blackouts' screen should be displayed

  @yammy @ui

  Scenario Outline: Verification screen on Blackouts Dashboard
    When I click '<action>' link
    Then '<screen>' screen should be displayed

  Examples:
    | action                      | screen                   |
    | Create a One-Time Blackout  | Create Blackout Wizard   |
    | Create a Scheduled Blackout | Create Blackout Wizard   |
    | Manage Blackouts            | Manage Blackouts         |
    | View Blackouts by Object    | View Blackouts By Object |
    | View Blackouts by Agent     | View Blackouts By Agent  |
