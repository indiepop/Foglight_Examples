Feature: Testing Metric
  In order to test the cylinder component
  As a component developer
  I want make sure the component works properly

  @ryan @dev
  Scenario Outline: Checking title, value and severe of <component name>
    Given opened '<dashboard>' screen using default credentials
    When I click 'The label' <component name>
  # check severe
    Then the severe of 'The label' <component name> should be 'normal'
    * the severe of 'The label' <component name> should not be 'warn'
    * the severe of 'The label' <component name> should not be 'error'
    * the severe of 'The label' <component name> should not be 'fatal'
  # reverse test of check severe
    * the severe of 'The label' <component name> should not be 'normal' should raise exception
    * the severe of 'The label' <component name> should be 'warn' should raise exception
    * the severe of 'The label' <component name> should be 'error' should raise exception
    * the severe of 'The label' <component name> should be 'fatal' should raise exception
  # check value
    * the value of 'The label' <component name> should be '25'
    * the value of 'The label' <component name> should not be '1'
    * the value of 'The label' <component name> should not be '2'
    * the value of 'The label' <component name> should not be '3'
    * the value of 'The label' <component name> should not be '4'
    * the value of 'The label' <component name> should not be '5'
    * the value of 'The label' <component name> should not be '6'
    * the value of 'The label' <component name> should not be '7'
    * the value of 'The label' <component name> should not be '8'
    * the value of 'The label' <component name> should not be '9'
    * the value of 'The label' <component name> should not be '10'
    * the value of 'The label' <component name> should not be '10 %'
    * the value of 'The label' <component name> should not be 'some words'
    * the value of 'The label' <component name> should not be ':)'
    * the value of 'The label' <component name> should not be '    '
  # reverse test of check value
    * the value of 'The label' <component name> should not be '25' should raise exception
    * the value of 'The label' <component name> should be '30' should raise exception
    * the value of 'The label' <component name> should be ':)' should raise exception
    * the value of 'The label' <component name> should be '  ' should raise exception
  # check value and severe
    * 'The label' <component name> should be 25% normal
    * 'The label' <component name> should not be 20% normal
    * 'The label' <component name> should not be 80% warn
    * 'The label' <component name> should not be 60% error
    * 'The label' <component name> should not be 40% fatal
    * 'The label' <component name> should not be 25% warn
    * 'The label' <component name> should not be 25% error
    * 'The label' <component name> should not be 25% fatal
    * 'The label' <component name> should not be 30% normal
    * 'The label' <component name> should not be 50% normal
    * 'The label' <component name> should not be 80% normal
  # reverse test of check value and severe
    * 'The label' <component name> should be 100% normal should raise exception
    * 'The label' <component name> should be 80% warn should raise exception
    * 'The label' <component name> should be 60% error should raise exception
    * 'The label' <component name> should be 40% fatal should raise exception
    * 'The label' <component name> should not be 25% normal should raise exception
  # bulk checking value
    * the value of 'The label' <component name> should not in the data below:
      | 20 |
      | 40 |
      | 50 |
      | 80 |
      | 99 |
  # reverse test bulk checking value
    * the value of 'The label' <component name> should not in the data below: should raise exception
      | 25 |
  # bulk checking value
    * the severe of 'The label' <component name> should not in the list below:
      | warn  |
      | error |
      | fatal |
  # reverse test of bulk checking value
    * the severe of 'The label' <component name> should not in the list below: should raise exception
      | normal |

    Examples:
      | dashboard                                                                                                | component name   |
      | Dashboards -> WCF Regression -> Metric Indicators -> Cylinder -> 550 -> Cylinders (grid)                 | cylinder         |
      | Dashboards -> WCF Regression -> Metric Indicators -> Horizontal Bar -> 550 -> Horizontal Bars (grid)     | horizontal bar   |
      | Dashboards -> WCF Regression -> Metric Indicators -> Vertical Bar -> 550 -> Vertical Bars (grid)         | vertical bar     |
      | Dashboards -> WCF Regression -> Metric Indicators -> Flow Gauge -> 550 -> Flow Gauges (grid)             | flow gauge       |
      | Dashboards -> WCF Regression -> Metric Indicators -> Metric Indicator -> 550 -> Metric Indicators (grid) | metric indicator |
      | Dashboards -> WCF Regression -> Metric Indicators -> Spinner -> 550 -> Spinners (grid)                   | spinner          |
