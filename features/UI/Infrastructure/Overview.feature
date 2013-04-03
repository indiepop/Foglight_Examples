Feature: Overview on Infrastructure Dashboard
  In order to mark sure this function works fine
  As a Administration
  I want to overview

  @yammy @ui
  Scenario: Overview on Infrastructure Dashboard
    Given opened 'Dashboards -> Infrastructure' screen using default credentials
    Then 'Infrastructure Environment' screen should be displayed

    When I click 'Monitoring' tab
    Then 'Summary - All Windows' message should be displayed

    When I click 'FAQts' tab
    Then 'Question0001' message should be displayed

    When I click 'Administration' tab
    Then 'Service Administration : Windows' message should be displayed

