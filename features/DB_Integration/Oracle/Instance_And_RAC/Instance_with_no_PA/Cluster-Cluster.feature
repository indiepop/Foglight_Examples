Feature: Cluster - Cluster
  As an administrator role

  @mark
  Scenario: Cluster - Cluster
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    And I click 'Cluster_not_selected.png' icon
    Then 'Cluster' screen should be displayed
    And 'This view is accessible only when a RAC is selected.' message should be displayed







