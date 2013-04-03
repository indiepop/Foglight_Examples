Feature: Changing user session settings on Users_And_Security Dashboard
  In order to make sure whether the change has been achieved
  As a Administration
  I want to change user session settings

  @yammy @ui
  Scenario: Changing user session settings on Users_And_Security Dashboard
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed

    When I click 'User Session Settings' link
    Then 'Change User Session Timeout' dialog should be displayed

    When I fill 'Change User Session Timeout' dialog with next values:
      | Number of minutes after which user should be logged out: | 5   |
      | Session Never Times Out[right]                           | off |
    And I click 'Ok' button in 'Change User Session Timeout' dialog
    And wait 305 seconds
    Then 'The page has expired' message should be displayed

    When I close browser

    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed

    When I click 'User Session Settings' link
    Then 'Change User Session Timeout' dialog should be displayed

    When I fill 'Change User Session Timeout' dialog with next values:
      | Number of minutes after which user should be logged out: | 60  |
      | Session Never Times Out[right]                           | off |
    And I click 'Ok' button in 'Change User Session Timeout' dialog
    




