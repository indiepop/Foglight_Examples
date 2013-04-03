@lane @dev
Feature: 
  In order to test the topology component
  As a component developer
  I want to make sure the component works properly

  Scenario: Column topology
    Given opened 'Dashboards->WCF Regression->Containers->Topology->562->Tab Column Topology' screen using default credentials
    Then 'Tab Column Topology' screen should be displayed
    Then 'Tab Column Topology' screen should contain following topology items:
      | percentSystemTime                      | Data Object       |
      | Host - jfeng-cc24c5d2f.prod.quest.corp | Host              |
      | Network                                | Service Group Box |
    When I hover over 'Host - jfeng-cc24c5d2f.prod.quest.corp' topology node icon
    And wait 5 seconds

  Scenario: Test Group Box
    Given opened 'Dashboards->WCF Regression->Containers->Topology->562->Tab Column Topology' screen using default credentials
    Then 'Tab Column Topology' screen should contain following topology items:
      | percentUserTime                        | Data Object       |
      | Host - jfeng-cc24c5d2f.prod.quest.corp | Host              |
      | Memory                                 | Service Group Box |
      | Storage                                | Service Group Box |
    Then 'Tab Column Topology' screen should not contain following topology items:
      | Storage1xx	     | VM         |
      | DASxx            | VM         |
      | migrate-vmxx	 | Data Store |
      | Fooxx  	         | Bar        |
      | unexisted-itexxm | VM         |
