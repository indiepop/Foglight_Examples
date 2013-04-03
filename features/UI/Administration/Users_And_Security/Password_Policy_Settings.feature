Feature: Changing password policy settings on Users_And_Security Dashboard
  In order to make sure whether the change has been achieved
  As a Administration
  I want to change password policy settings

  @yammy @ui
  Scenario: Changing password policy settings on Users_And_Security Dashboard
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed

    When I click 'Password Policy Settings' link
    Then 'Password Settings' screen should be displayed

    When I set value '8' in the 2rd column in 'Password Settings' grid which contain next values:
      | Value |
      | 7     |
    And I click 'Save Changes' button
    And wait 3 seconds
    And I click 'Sign Out' link
    Then 'You have been logged out' message should be displayed

    When I click 'Change Password' link
    And I type 'foglight' in 'User' field
    And I type 'foglight' in 'Old Password' field
    And I type '1234567' in 'New Password' field
    And I type '1234567' in 'Confirm Password' field
    And I click 'Change Password' link
    And wait 5 seconds
    Then 'Error: The password should be at least 8 characters long' message should be displayed





