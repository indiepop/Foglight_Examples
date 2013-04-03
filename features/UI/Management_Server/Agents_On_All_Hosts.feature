Feature: Verification agents on Management Server Dashboard
  In order to make sure whether create threshold successed
  As a Administration
  I want to verification agents

  Background: Go to the same screen
    Given opened 'Dashboards -> Management Server -> Agents' screen using default credentials
    Then 'Agents on' screen should be displayed

  @yammy @ui
  Scenario Outline: Verification agents on Management Server Dashboard
    When I click 'add16.png' icon
    Then 'Create Simple Global Service' dialog should be displayed

    When I fill 'Create Simple Global Service' dialog with next values:
      | Name              | <name>             |
      | Short Description | This is a test     |
      | Description       | Agent on all hosts |
    And I click 'Create' button in 'Create Simple Global Service' dialog
    Then The 1st '[unnamed]' combobox should contain next values:
      | <name> |

  Examples:
    | name    |
    | Test    |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |

  @yammy @ui
  Scenario Outline: Edit host on Management Server Dashboard
    When I select '<name>' in the 1st '[unnamed]' field
    And wait 10 seconds
    And I click 'edit.png' icon
    Then 'Service Builder' screen should be displayed in 30 seconds

  Examples:
    | name    |
    | Test    |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |

  @yammy @ui
  Scenario Outline: Delete host on Management Server Dashboard
    When I select '<name>' in the 1st '[unnamed]' field
    And I click 'remove16.png' icon
    Then 'Delete Current Object Confirmation and Update Services' dialog should be displayed

    When I click 'Confirm' button in 'Delete Current Object Confirmation and Update Services' dialog
    Then The 2nd '[unnamed]' select should not contain next values:
      | test |

  Examples:
    | name    |
    | Test    |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |

  @yammy @ui
  Scenario: Search host on Management Server Dashboard
    When I select 'Windows' in the 1st '[unnamed]' field
    And I type 'yammy' into 2nd input
    And I click 'Search' button
    Then 'Agents on' screen tree grid should contain next rows:
      | Name            |
      | yammy-win2k364 |




