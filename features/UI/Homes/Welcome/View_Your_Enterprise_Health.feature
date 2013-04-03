Feature: View enterprise health screen on Welcome Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to check screen

  @yammy @ui
  Scenario Outline: View enterprise health screen on Welcome Dashboard
    Given opened 'Homes -> Welcome' screen using default credentials
    Then 'Welcome' screen should be displayed

    When I click 'View Your Enterprise Health' link
    Then 'View Your Enterprise Health' screen should be displayed

    When I click '<link>' link
    Then '<screen>' screen should be displayed

    Examples:
      | link                                                      | screen                     |
      | View, Acknowledge, and Clear Recent Alarms                | Alarms                     |
      | View Enterprise Health Organized by Monitoring Domain     | Domain                     |
      | View the Health of Critical Services                      | Service Operations Console |
      | View the Health of the Monitored Hosts in Your Enterprise | Infrastructure Environment |
