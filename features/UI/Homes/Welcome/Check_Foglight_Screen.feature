Feature: Do more with foglight
  In order to make sure this function works fine
  As a Administration
  I want to do more with foglight

  @yammy @ui
  Scenario Outline: Do more with foglight on Welcome Dashboard
    Given opened 'Homes -> Welcome' screen using default credentials
    Then 'Welcome to Foglight' message should be displayed

    When I click 'Do More with Foglight' link
    Then 'Do More With Foglight' screen should be displayed

    When I click '<link>' link
    Then '<screen>' screen should be displayed

    Examples:
      | link                | screen          |
      | Administer Foglight | Administration  |
      | Define Services     | Service Builder |
      | View Agent Status   | Agent Status    |


