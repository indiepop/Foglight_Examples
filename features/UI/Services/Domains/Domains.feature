Feature:  Monitored Domains View on Domains dashboard
  As an Administrator
  I want to view domains with correct state

  Background: Go to Domains dashboard
   Given opened 'Dashboards -> Services -> Domains' screen using default credentials
   Then 'Domains' screen should be displayed

  @linda @ui
  Scenario:  View Infrastructure domain's information
   When I click 'Infrastructure' link on 'Domains' screen
    And wait 3 seconds
    Then '[unnamed]' popup should be displayed
    Then 'Drilldown' message should be displayed in '[unnamed]' popup
    And I click 'Drilldown' link in '[unnamed]' popup
    Then 'Monitored Hosts Only (Infrastructure)' screen should be displayed

