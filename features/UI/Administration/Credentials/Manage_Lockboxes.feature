Feature: Manage Lockboxes
  In order to manage lockboxes
  As a system administrator
  I should add new lockbox and try to remove the exiting lockbox

  Background: Go to user management dashboard
    Given opened 'Dashboards -> Administration -> Credentials' screen using default credentials
    When I click 'Manage Lockboxes' link
    Then 'Manage Lockboxes' screen should be displayed

  @mark
  Scenario: Add a Lockbox with password
    When I click 'Add' button
    Then 'New Lockbox' dialog should be displayed

    When I fill 'New Lockbox' dialog with next values:
      | Name                           | Lockbox1 |
      | Secure using a password[right] | on       |
      | Password                       | abcdefg1 |
      | Confirm Password               | abcdefg1 |
    And I click 'Add' button in 'New Lockbox' dialog
    Then 'Manage Lockboxes' screen grid should contain next rows:
      | Name     |
      | Lockbox1 |

  Scenario: Add a lockbox without password
    When I click 'Add' button
    Then 'New Lockbox' dialog should be displayed

    When I fill 'New Lockbox' dialog with next values:
      | Name | Lockbox2 |
    And I click 'Add' button in 'New Lockbox' dialog
    Then 'Manage Lockboxes' screen grid should contain next rows:
      | Name     |
      | Lockbox2 |

  Scenario: Delete lockbox
    When I check rows on 'Manage Lockboxes' screen grid which contain next values:
      | Name     |
      | Lockbox2 |
    And I click 'Delete' button
    Then 'Confirm Deleting Lockboxes' dialog should be displayed in 400 seconds

    When I click 'Confirm' button
    Then 'Manage Lockboxes' screen grid should not contain next rows:
      | Lockbox2 |

  Scenario: Add , Remove or Change Password
    When I click in the 'change_password16.png' icon in 'Manage Lockboxes' screen grid which contain next values:
      | Name     |
      | Lockbox1 |
    Then 'Change Password of Lockbox: ' dialog should be displayed

    When I fill 'Change Password of Lockbox: ' dialog with next values:
      | Lockbox Password     | abcdefg1 |
      | New Password         | foglight |
      | Confirm New Password | foglight |
    And I click 'Confirm' button
    Then 'Manage Lockboxes' screen grid should contain next rows:
      | Name     |
      | Lockbox1 |

    When I click in the 'remove16.png' icon in 'Manage Lockboxes' screen grid which contain next values:
      | Name     |
      | Lockbox1 |
    Then 'Remove Password of Lockbox: ' dialog should be displayed

    When I fill 'Remove Password of Lockbox: ' dialog with next values:
      | Lockbox Password | foglight |
    And I click 'Confirm' button
    Then 'add16.png' icon should be displayed

    When I click in the 'add16.png' icon in 'Manage Lockboxes' screen grid which contain next values:
      | Name     |
      | Lockbox1 |
    Then 'Add Password To Lockbox: ' dialog should be displayed

    When I fill 'Add Password To Lockbox: ' dialog with next values:
      | New Password         | abcdefg1 |
      | Confirm New Password | abcdefg1 |
    And I click 'Confirm' button
    Then 'remove16.png' icon should be displayed


