Feature: Search user on Users_And_Security Dashboard
  In order to make sure whether can search user
  As a Administration
  I want to search user

  @yammy @ui
  Scenario Outline: Searching user on Users_And_Security Dashboard
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed

    When I type '<name>' into 2nd input
    And I click 'Look up' button
    Then 'Details of <name>' screen should be displayed

  Examples:
    | name     |
    | foglight |
    | test     |
    | 1        |
    | .yammy   |
    | 珠海虹天   |