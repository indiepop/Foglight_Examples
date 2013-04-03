
Feature: Check tree table
  @Bella
Scenario: Check tree table
Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Tree Table -> 562 -> Tree Table 3' screen using default credentials


  When I click 'Select-All' button
  And I click 'Show Selected' button
   Then 'Row-Oriented Table for Tree Table 3' dialog should be displayed
#   Then 'Row-Oriented Table for Tree Table 3' dialog grid should contain 7 rows
#        | Name |
#        | wcf001.prod.quest.corp |
#        | CPUs                   |
#        | Network |
#        |0|
#        |VMware Accelerated AMD PCNet Adapter|
#        |MS TCP Loopback interface|
   And I close 'Row-Oriented Table for Tree Table 3' dialog


    When I click 'Unselect-All' button
    And I click 'Show Selected' button
    Then 'Row-Oriented Table for Tree Table 3' dialog should be displayed
    Then 'Row-Oriented Table for Tree Table 3' dialog grid should contain 'There Is No Data To Display'
    And I close 'Row-Oriented Table for Tree Table 3' dialog


    When I navigate 'yammy_win2k364' in 'Tree Table 3' tree grid
#    Then 'Tree Table 3' tree grid should contain next rows:
#      | Name  | Topology Type Name  |
#      | CPUs   | HostCPUs |
#      | Network | HostNetwork |
    And I click row by 'yammy_win2k364 -> CPUs ' in 'Tree Table 3' tree grid
    And I click 'Show Selected' button
    Then 'Row-Oriented Table for Tree Table 3' dialog should be displayed
    Then 'Row-Oriented Table for Tree Table 3' dialog grid should contain 2 rows
    And I close 'Row-Oriented Table for Tree Table 3' dialog


#    When I click 'Visit Quest.com' button
#    And I close browser








