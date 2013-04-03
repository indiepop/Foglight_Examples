Feature: Storage - Redo Logs
  As an administrator role

  @mark @TODO
  Scenario: Storage - Redo Logs
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'storage_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'Redo Logs' link in '[unnamed]' popup
    Then 'Redo Logs Storage' message should be displayed
#    When I click '1' link in 'Storage' screen
#    Then 'Members of Group:1' panel grid should contain next rows:
#      | Member Name                                  | Member Status |
#      | C:\APP\ADMINISTRATOR\ORADATA\ORCL\REDO01.LOG | IN USE        |
