Feature: Manage category on Service Builder Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to add, edit and remove category

  Background: Go to the same screen
    Given opened 'Dashboards -> Services -> Service Builder' screen using default credentials
    Then 'Service Builder' screen should be displayed

  @yammy @ui

  Scenario Outline: Adding mailing list configuration on Service Builder Dashboard
    When I click in the 'emailList-add16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component |
      | <name>    |
    Then 'Add Mailing List Configuration Dialog for: <name>' dialog should be displayed

    When I type 'yammy.chen@quest.com' into textarea
    And I click 'Save' button

  Examples:
    | name   |
    | Test   |
    | test   |
    | 1      |
    | .yammy |
    | 珠海虹天   |

  @yammy @ui

  Scenario Outline: Edit category on Service Builder Dashboard
    When I click in the 'edit.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component |
      | <name>    |
    Then 'Edit Service Wizard' dialog should be displayed

    When I fill 'Edit Service Wizard' dialog with next values:
      | Name              | <name>          |
      | Short Description | Edit            |
      | Description       | Edit a category |
    And wait 10 seconds
    And I click 'Next' button in 'Edit Service Wizard' dialog
    Then 'Assign Domains' message should be displayed

    When I check rows on 'Edit Service Wizard' dialog grid which contain next values:
      | Name    |
      | Windows |
    And I click 'Finish' button in 'Edit Service Wizard' dialog
    And wait 5 seconds
    And I refresh the browser
    Then 'Service Builder' screen tree grid should contain next rows:
      | Component |
      | <name>    |

  Examples:
    | name   |
    | Test   |
    | test   |
    | 1      |
    | .yammy |
    | 珠海虹天   |

  @yammy @ui

  Scenario: Delete category on Service Builder Dashboard
    When I click in the 'remove16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component |
      | test      |
    And I select 'Remove Monitored Components in Selected Category' in '[unnamed]' popup
    Then 'Remove Monitored Components in: test' dialog should be displayed

    When I check rows on 'Remove Monitored Components in: test' dialog grid which contain next values:
      | Monitored Component |
      | testGlobalService1  |
    And I click 'Remove' button

  @yammy @ui

  Scenario: Delete category on Service Builder Dashboard
    When I click in the 'remove16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component |
      | test      |
    And I select 'Remove Selected Category' in '[unnamed]' popup
    Then 'Delete Current Object Confirmation' dialog should be displayed

    When I click 'Confirm' button in 'Delete Current Object Confirmation' dialog
    Then 'Service Builder' screen tree grid should contain next rows:
      | test |


