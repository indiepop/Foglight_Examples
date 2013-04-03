Feature: Configure alarm reporting and blackouts
  In order to make sure this function works fine
  As a Administration
  I want to configure alarm reporting and blackouts

  @yammy @ui
  Scenario Outline: Configure alarm reporting and blackouts on Welcome Dashboard
    Given opened 'Homes -> Welcome' screen using default credentials
    Then 'Welcome' screen should be displayed

    When I click 'Configure Alarm Reporting and Blackouts' link
    Then 'Configure Alarm Reporting and Blackouts' screen should be displayed

    When I click '<link>' link
    Then '<screen>' screen should be displayed

    Examples:
      | link                     | screen              |
      | Configure Email Settings | Email Configuration |
      | Blackout Configuration   | Blackouts           |
