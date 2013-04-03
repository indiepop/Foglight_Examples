Feature: Check intelliprofile on Date Dashboard
  In order to make sure this function is fine
  As a Administration
  I want to test intelliprofile

  Background: Go to the data dashboard
    Given opened 'Dashboards -> Administration -> Data -> IntelliProfile' screen using default credentials
    Then 'IntelliProfile' screen should be displayed

  @yammy @ui

  Scenario: Edit intelliprofile on Data Dashboard
    When I set value '94' in the 3th column in 'IntelliProfile' grid which contain next values:
      | Below (%) |
      | 95        |
    And I set value '96' in the 3th column in 'IntelliProfile' grid which contain next values:
      | Below (%) |
      | 97        |
    And I set value '98' in the 3th column in 'IntelliProfile' grid which contain next values:
      | Below (%) |
      | 99        |
    And I click 'Save Changes' button
    Then 'Save IntelliProfile' dialog should be displayed

    When I click 'OK' button in 'Save IntelliProfile' dialog
    And opened 'Dashboards -> Administration -> Rules & Notifications -> Manage Registry Variables' screen
    And I search 'IntelliProfile_Percentile' in 'Manage Registry Variables' screen grid
    Then 'Manage Registry Variables' screen grid should not contain next rows:
      | Variable Name              | Global Default | Scoped Default (TopologyObject) |
      | IntelliProfile_Percentile4 | 94             | 94                              |
      | IntelliProfile_Percentile5 | 97             | 97                              |
      | IntelliProfile_Percentile6 | 98             | 98                              |

  @yammy @ui

  Scenario: Test intelliprofile on Data Dashboard
    When I set value '93' in the 3th column in 'IntelliProfile' grid which contain next values:
      | Below (%) |
      | 98        |
    And I click 'Save Changes' button
    Then 'Validation Messages' dialog should be displayed

    When I click 'OK' button in 'Validation Messages' dialog
    And I close browser