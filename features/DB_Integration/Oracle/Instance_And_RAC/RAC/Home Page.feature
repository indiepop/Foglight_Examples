Feature: Test for Home page when instance with no PA
  Hover over some components
  Tooltip is displayed with a short explanation and a performance report
  The component's color should be according to the performance report (the most severe among the displayed messages)
  If component's severity is green (=normal)- the tooltip presents- "No performance anomaly has been detected"
  If component's severity is other than green (yellow\orange\red)- the tooltip presents the reason for this anomaly
  Click on some of the components
  Popup opens with a short explanation, a chart, a performance report, a link to investigate more using a drilldown and further details about this control
  Chart has measures and data is displayed within its limits
  component's color is according to the performance report (the most severe among the displayed messages)
  Use the link to investigate more (if there is), check that you drilldown to the correct screen and data is seen

  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario:  Home page view
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |

  # verify  Hover over some components, Tooltip is displayed with a short explanation and a performance report
    And I hover over 'Response Time'
    Then 'Response Time' popup should be displayed
  # show short explanation
    And 'Displays the average time (in milliseconds)' message is displayed
  # show performance report
    And  'No performance anomaly has been detected.' message is displayed
  # If component's severity is green (=normal)- the tooltip presents- "No performance anomaly has been detected"

  #Click on some of the components, Popup opens with a short explanation, a chart, a performance report, a link to investigate more using a drilldown and further details about this control
    And I click "Response Time" metric indicator
    Then 'Response Time' popup should be displayed
  # show short explanation
    And 'Displays the average time (in milliseconds)' message is displayed
  # show a chart
    Then   'Response Time' chart should be displayed
  # a link to investigate more using a drilldown
    And I click 'investigate using the "Instance Usability" drilldown...' link
    Then 'Instance Usability' message is displayed


  #