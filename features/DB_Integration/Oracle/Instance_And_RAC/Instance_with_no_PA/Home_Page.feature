Feature: Test for Home page when instance with no PA
  As a administrator role

  @mark @TODO
  Scenario:  Home page view
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    Then 'Databases' screen should be displayed
    When I click '10.30.149.39-ORCL' link
    Then 'Workload' message should be displayed
    When I click 'HomePageLink.png' icon
    Then '10.30.149.39-ORCL' screen should be displayed
    And '10.30.149.39-ORCL' screen grid should not contain 'n/a'
    And 'Instance' panel should be displayed
    And 'Workload' panel should be displayed
    And 'Disk Storage' panel should be displayed
    And 'Host' panel should be displayed
#    When I click 'Response Time' metric indicator
#    And wait 5 seconds
#  # verify  Hover over some components, Tooltip is displayed with a short explanation and a performance report
#    And I hover over 'Response Time'
##    Then 'Response Time' panel should be displayed
#  # show short explanation
#    And 'Displays the average time (in milliseconds)' message is displayed
#  # show performance report
#    And  'No performance anomaly has been detected.' message is displayed
#  # If component's severity is green (=normal)- the tooltip presents- "No performance anomaly has been detected"
#
#  #Click on some of the components, Popup opens with a short explanation, a chart, a performance report, a link to investigate more using a drilldown and further details about this control
#    And I click 'Response Time' metric indicator
##    Then 'Response Time' frame should be displayed
#  # show short explanation
#    And 'Displays the average time (in milliseconds)' message is displayed
#  # show a chart
##    Then 'Response Time' chart should be displayed
#  # a link to investigate more using a drilldown
#    And I click 'Investigate using the "Instance Usability" drilldown...' link
#    Then 'Instance Usability' message is displayed
