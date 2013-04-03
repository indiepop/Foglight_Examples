Feature: Automation for Containers -> Tab Container

  @jacin
Scenario: Test Tab Container
    Given opened 'Dashboards->WCF Regression->Containers->Tab Container->520->Tab Container 1 - Customizer and Co-op' screen using default credentials
    Then 'Tab Container 1 - Customizer and Co-op' screen should be displayed

    Then I click 'CPU and MEM Utilization' link

    Then I click 'Cluster Bar Chart 1 - Alarms' link

    Then I click 'Tree Table 1' link

#    Then I click 'Monitor@10.30.149.41' link
#    And  I click the cell in the 1st column in 'Tab Container 1 - Customizer and Co-op' grid which contain next values:
#        | Name |
#        | Monitor@10.30.149.41 |

#    Then 'Summary for Monitor@10.30.149.41' screen should be displayed
#    And 'Summary for Monitor@10.30.149.41' screen grid should contain 'Monitor@10.30.149.41'
#    And 'Metrics' panel should be displayed

#    Then I click 'Tab Container 1 - Customizer and Co-op' link
    And  I click the cell in the 3st column in 'Tab Container 1 - Customizer and Co-op' grid which contain next values:
      | topologyTypeName |
      | winICagent       |
    Then 'Outstanding Alarm(s)' dialog should be displayed
#    And I click the 1st 'Alarm(s)' tab
#    And I click the 1st 'Error Instance(s)' tab
#    And I click the 1st 'Related Host(s)' tab
#    And I click the 1st 'Related Agent(s)' tab



