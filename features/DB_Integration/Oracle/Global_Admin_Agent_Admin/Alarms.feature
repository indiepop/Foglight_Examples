Feature: Alarm, Verify Alarm dashboard
  As a  administrator role

  @mark @TODO
  Scenario: Alarms
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    When I check rows on 'Databases' screen grid which contain next values:
      | Host      |
      | databases |
    And wait 2 seconds
    And I click 'GlobalAdmin_Link.png' icon
    Then 'Global Administration' screen should be displayed in 400 seconds
    And I navigate to 'Oracle->Alarms' in 'Global Administration' tree
    And 'The Alarms screen displays a list of all alarms and their configuration options.' message should be displayed in 400 seconds


#Scenario Outline: : Alarms
#    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
#    When I check rows on 'Databases' screen grid which contain next values:
#      | Host      |
#      | databases |
#    And wait 2 seconds
#    And I click 'GlobalAdmin_Link.png' icon
#    Then 'Global Administration' screen should be displayed
#    And I navigate to 'Oracle -> <Name> ' in 'Global Administration' tree
#    And '<Message>' message should be displayed
#
#  Examples:
#    | Name      | Message                                                                          |
#    | Alarms    | The Alarms screen displays a list of all alarms and their configuration options. |
#    | Alert Log | The Alert Log administration screen allows handling Oracle alerts as follows     |


