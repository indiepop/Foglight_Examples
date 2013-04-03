Feature: Check Label 1

  @Bella @wcf
  Scenario: Check Label 1
  Given opened 'Dashboards -> WCF Regression -> Others -> Label -> 520 -> Label 1 - Long Text' screen using default credentials

  Then 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' Message should be displayed