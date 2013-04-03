Feature: Overview on home dashboard
  In order to make sure this function works fine
  As a Administration
  I want to do more with this dashboard

  @yammy @ui
  Scenario Outline: Do more with foglight on Welcome Dashboard
    Given opened 'Homes -> <link>' screen using default credentials
    Then '<screen>' screen should be displayed

  Examples:
    | link                       | screen                     |
    | Administration             | Administration             |
    | Agents                     | Agents on All Hosts        |
    | Alarms                     | Alarms                     |
    | Domains                    | Domains                    |
    | Hosts                      | Hosts                      |
    | Reports                    | Reports                    |
    | Service Operations Console | Service Operations Console |
    | Welcome                    | Welcome                    |
