Feature: Execute licenses on Manage Licenses Dashboard
  In order to check licenses
  As a Administration
  I want to install and delete licenses

  @yammy @ui

  Scenario: Delete Licenses on Manage Licenses Dashboard


    And 'Manage Licenses' screen grid should contain next rows:
      | Serial Number |
      | 123-45678     |
    When I check rows on 'Manage Licenses' screen grid which contain next values:
      | Serial Number |
      | 123-45678     |
    And  I click 'Delete' button
    Then 'License Confirmation' dialog should be displayed

    And wait 5 seconds
    When I click 'OK' button
    Then 'Manage Licenses' screen grid should not contain next rows:
      | 123-45678 |

  @yammy @ui

  Scenario: Install Licenses on Manage Licenses Dashboard
    Given opened 'Dashboards -> Administration -> Setup & Support -> Manage Licenses' screen using default credentials
    Then 'Manage Licenses' screen should be displayed
    And wait 10 seconds

    When I click 'Install' button
    Then 'Install License' dialog should be displayed

    When I upload file "*work_dir*\resources\Foglight.license" in 'Install License' dialog
    And I click 'Install License' button
    And wait 5 seconds
    Then 'Manage Licenses' screen grid should contain next rows:
      | Serial Number |
      | 123-45678     |

