Feature: test upload

  Scenario: test upload
    Given opened 'Dashboards -> Administration -> Data -> Add Topology Type' screen using default credentials
    Then 'Add Topology Type' screen should be displayed

    When I upload file "D:\mmovie.xml" in 'Import From File' panel
    And wait 5 seconds
    Then I click 'Import' button
    And wait 5 seconds