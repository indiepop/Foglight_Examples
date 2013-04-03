Feature: Check Help Viewer

  @Bella @wcf
  Scenario: Check Help Viewer
      Given opened 'Dashboards -> WCF Regression -> Others -> Help Viewer -> 560 -> Help Viewer' screen using default credentials

   And 'Common_web-components.component/wcf/label/index' message should be displayed