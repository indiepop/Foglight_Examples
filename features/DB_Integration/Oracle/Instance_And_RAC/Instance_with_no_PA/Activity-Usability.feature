Feature: Activity -> Usability

  As a  administrator role

  @mark @TODO
  Scenario:  Activity -> Usability
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
  #    Then '10.30.149.39-ORCL' screen should be displayed
    When I click 'activity.png' icon
    Then '[unnamed]' popup should be displayed
    And I click 'Usability' link in '[unnamed]' popup
    Then 'Instance Usability' message should be displayed
#    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
#    And I click 'ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102' link
#    And I click "Home Page" button
#
#  #  Click on 'Activity' icon on the toolbar, click on 'Usability' option
#    And I click "Activity" button on toolbar
#    And I click 'Usability' link
#  # Data is seen under 'Instance Usability' Pane
#    Then 'Instance Usability' message is displayed
#    And '10.2.0.1.0' message is displayed
#
#  # Click on The Alarms in case the Alarms appear at the top-right side of the screen
#    And I click 'Alarms' table
#    Then the title in the current popup window should contain 'ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102'