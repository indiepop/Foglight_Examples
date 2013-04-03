Feature: View audit information on View Audit Information Dashboard
  In order to check audit information
  As a Administration
  I want to do some operation

  @yammy @ui @todo
  Scenario: Checking audit information on View Audit Information Dashboard
    Given opened 'Dashboards -> Administration -> Setup & Support -> View Audit Information' screen using default credentials
    Then 'View Audit Information' screen should be displayed

    When I search 'installCar (Infrastructure-5_6_3.car)' in 'View Audit Information' screen grid
    Then 'View Audit Information' screen grid should contain next rows:
      | User Name | Operation Name (Name)                 |
      | foglight  | installCar (Infrastructure-5_6_3.car) |
