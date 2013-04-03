Feature: Testing Log check
  In order to test Log check
  As a component developer
  I want make sure the component works properly

  Scenario: test
    Given I create log checker on machine 'FMS'
    When wait 60 seconds
    And I check in log on machine 'FMS'

