Feature: Storage - Tablespaces
  As a  administrator role

  @mark @TODO
  Scenario:Storage - Tablespaces
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'storage_nor.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'Tablespaces and Datafiles' link in '[unnamed]' popup
    Then 'Top 10 Tablespaces' message should be displayed in 400 seconds
  #    Then grid in 'Storage' screen should not contain 'n/a'
  #    And I click 'Size' link
  #    And I click '% Space Usage' link
    And wait 15 seconds
    When I click 'SYSTEM' link in 'Tablespaces Summary' grid
    Then 'SYSTEM' message should be displayed
    And 'Tablespace Properties' panel should be displayed
  #    And grid in 'Tablespace Properties' panel should not contain 'n/a'
    And 'Space Utilization' chart should be displayed
    And 'Fragmentation analysis is a resource-consuming operation.' message should be displayed
    When I click 'Click here to retrieve data for the selected tablespace.' link
    Then 'Analyze Free Space Fragmentation' message should be displayed in 400 seconds
#    Then grid in 'Free Space Fragmentation' panel should not contain 'n/a'
    And 'Tablespace Details' panel should be displayed
#    And I click 'All Metrics' tab
#    Then grid in 'Tablespace Details' panel should not contain 'n/a'
    When I click 'C:\APP\ADMINISTRATOR\ORADATA\ORCL\SYSTEM01.DBF' link
    Then 'Datafile Properties' grid should be displayed
    And 'C:\APP\ADMINISTRATOR\ORADATA\ORCL\SYSTEM01.DBF' message should be displayed
#    And grid in 'Storage' screen should not contain 'n/a'
    When I click 'Analyze Fragmentation' link
    Then 'Warning' dialog should be displayed
    When I close browser
#    And I click 'Yes' button



