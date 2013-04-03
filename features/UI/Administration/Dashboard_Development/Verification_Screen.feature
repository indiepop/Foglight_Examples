Feature: Verification screen on Dashboard Development Dashboard
  In order to make sure those screen works fine
  As a Administration
  I want to do some execute

  Background: Go to the same screen
    Given opened 'Dashboards -> Dashboard Development' screen using default credentials
    Then 'Dashboard Development' screen should be displayed

  @yammy @ui

  Scenario Outline: Clicking links on navigation
    When I click '<action>' action
    Then '<screen>' screen should be displayed
#    And machine 'FMS' should not contain ERROR,FATAL in log

  Examples:
    | action                     | screen                        |
    | Module Unit Test Report    | Module Unit Test Report       |
    | Types Documentation Report | Types Documentation Report    |
    | Help Identifier            | Help Identifier               |
    | Definitions Statistics     | Definitions Statistics        |
    | Persistence Storage Usage  | Page persistence table        |
    | Data Source Validation     | Datasource Validation Results |
    | Module Validation          | Module Validation             |


