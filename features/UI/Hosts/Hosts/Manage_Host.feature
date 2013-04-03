Feature: Manage host on Hosts Dashboard
  In order to collect data
  As a Administration
  I want to add, edit and delete host

  Background: Go to the hosts screen
    Given opened 'Dashboards -> Hosts -> Hosts' screen using default credentials
    Then 'Monitored Hosts Only' screen should be displayed

  @yammy @ui
  Scenario Outline: Add host on Hosts Dashboard
    When I click 'add16.png' icon
    Then 'Create Simple Global Service' dialog should be displayed

    When I fill 'Create Simple Global Service' dialog with next values:
      | Name              | <name>                |
      | Short Description | This is a test      |
      | Description       | This is a host test |
    And I click 'Create' button in 'Create Simple Global Service' dialog
    Then The 2nd '[unnamed]' select should contain next values:
      | <name> |

  Examples:
    | name    |
    | Test    |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |


  @yammy @ui
  Scenario Outline: Edit host on Hosts Dashboard
    When I select '<name>' in the 2nd '[unnamed]' field
    And wait 10 seconds
    And I click 'edit.png' icon
    Then 'Service Builder' screen should be displayed in 60 seconds

  Examples:
    | name    |
    | Test    |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |

  @yammy @ui
  Scenario Outline: Delete host on Hosts Dashboard
    When I select '<name>' in the 2nd '[unnamed]' field
    And I click 'remove16.png' icon
    Then 'Delete Current Object Confirmation and Update Services' dialog should be displayed

    When I click 'Confirm' button in 'Delete Current Object Confirmation and Update Services' dialog
    Then The 2nd '[unnamed]' select should not contain next values:
      | <name> |

  Examples:
    | name    |
    | Test    |
    | test    |
    | 1       |
    | .yammy  |
    | 珠海虹天 |

