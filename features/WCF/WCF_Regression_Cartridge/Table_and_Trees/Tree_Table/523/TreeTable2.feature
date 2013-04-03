Feature: Check tree table2

  @Bella @wcf
  Scenario: Check tree table2
    Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Tree Table -> 523 -> Tree Table 2' screen using default credentials

    When I navigate 'yammy_win2k364' in 'Tree Table 2' tree grid
    Then 'Tree Table 2' tree grid should not contain next rows:
      | Topology Type Name |
      | Agents             |
      | OS                 |
      | F4Table            |
    And 'Tree Table 2' tree grid should contain next rows:
      | Name    | Topology Type Name |
      | Storage | HostStorage        |

    And I navigate 'yammy_win2k364 -> Storage ' in 'Tree Table 2' tree grid
    Then  'Tree Table 2' tree grid should contain next rows:
      | Name | Topology Type Name |
      | C:   | LogicalDisk        |

