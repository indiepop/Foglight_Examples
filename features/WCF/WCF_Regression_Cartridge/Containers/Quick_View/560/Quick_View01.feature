Feature: Automation for Containers -> Quick View

  @jacin
Scenario: Test Quick View
    Given opened 'Dashboards->WCF Regression->Containers->Quick View->560->Quick View 01' screen using default credentials
    Then 'Quick View 01' screen should be displayed

    Then  I click the cell in the 1st column in 'domainWindows001' screen grid which contain next values:
       | All domainWindows001 |
       | jacin02_winxp |