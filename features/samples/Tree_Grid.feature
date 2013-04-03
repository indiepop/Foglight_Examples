Feature: Testing TreeWcfTable
  In order to test the TreeWcfTable component
  As a component developer
  I want make sure the component works properly

  Scenario: Test navigate tree element
    Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Tree Table -> 523 -> Tree Table 2' screen using default credentials
    When I navigate 'jfeng-cc24c5d2f.prod.quest.corp -> With Agents -> With Agents -> Host Groups' in 'Tree Table 2' tree grid
    And I click customize in 'Tree Table 2' tree grid
    And wait 5 seconds

  Scenario: Test tree grid should contains rows
    Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Tree Table -> 562 -> Tree Table 3' screen using default credentials
    When I navigate 'jfeng-cc24c5d2f.prod.quest.corp -> CPUs -> 0' in 'Tree Table 3' tree grid
    Then 'Tree Table 3' tree grid should contain next rows:
      | Name    |
      | Network |

    When I navigate 'jfeng-cc24c5d2f.prod.quest.corp -> Network -> MS TCP Loopback interface' in 'Tree Table 3' tree grid
    Then 'Tree Table 3' tree grid should contain rows by 'jfeng-cc24c5d2f.prod.quest.corp -> Network -> MS TCP Loopback interface'
    And wait 5 seconds

  Scenario: Test get row by mixpath
    Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Tree Table -> 523 -> Tree Table 2' screen using default credentials
    When I navigate 'jfeng-cc24c5d2f.prod.quest.corp -> Infrastructure -> Normal -> Normal' in 'Tree Table 2' tree grid
    And I get row by 'jfeng-cc24c5d2f.prod.quest.corp -> Infrastructure -> Normal -> Normal' in 'Tree Table 2' tree grid
    And wait 5 seconds

  Scenario:  Test click row by mixpath
    Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Tree Table -> 562 -> Tree Table 3' screen using default credentials
    When I navigate 'jfeng-cc24c5d2f.prod.quest.corp -> CPUs -> 0' in 'Tree Table 3' tree grid
    When I click row by 'jfeng-cc24c5d2f.prod.quest.corp -> CPUs -> 0' in 'Tree Table 3' tree grid
    And wait 5 seconds

  Scenario: Test drop vscrollbar, click toolbar button, click customizer
    Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Tree Table -> 562 -> Tree Table 3' screen using default credentials
    When I navigate 'jfeng-cc24c5d2f.prod.quest.corp -> Network -> MS TCP Loopback interface' in 'Tree Table 3' tree grid
    And I drop vscrollbar in 'Tree Table 3' tree grid to find next values:
      | Name                                    |
      | Intel[R] PRO_1000 MT Network Connection |
    And I click 'Name' cell in rows in 'Tree Table 3' tree grid which contain next values:
      | Name                                    |
      | Intel[R] PRO_1000 MT Network Connection |

    Then I click the toolbar 'Show Selected' button in 'Tree Table 3' tree grid
    And wait 5 seconds

    Then I click customize in 'Tree Table 3' tree grid
    And wait 5 seconds

  Scenario: Test check rows and click toolbar button
    Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Tree Table -> 562 -> Tree Table 3' screen using default credentials
    When I check rows in 'Tree Table 3' tree grid which contain next values:
      | Name                            |
      | jfeng-cc24c5d2f.prod.quest.corp |
    Then I click the toolbar 'Show Selected' button in 'Tree Table 3' tree grid
    And wait 5 seconds






