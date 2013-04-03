Feature: Activity -> User-defined Collections
  As a  administrator role

  @mark @TODO
  Scenario:  Activity - User-defined Collections
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
  #    Then '10.30.149.39-ORCL' screen should be displayed
    When I click 'activity.png' icon
    Then '[unnamed]' popup should be displayed
    When I click 'User-defined Collections' link in '[unnamed]' popup
    Then 'User-defined Collections' message should be displayed
#    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
#    And I click 'ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102' link
#    And I click "Home Page" button
#  # Click on Activity icon on the toolbar,click on 'User-defined Collections' option
#    And I click "Activity" button on toolbar
#    And I click 'User-defined Collections' link
#
#  #  Grid with relevant data appears
#    Then 'Query's Full SQL Text' message is displayed





