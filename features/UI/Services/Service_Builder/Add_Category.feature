Feature: Add category on Service Builder Dashboard
  In order to make sure this function works fine
  As a Administration
  I want to add category

  Background: Go to the same screen
    Given opened 'Dashboards -> Services -> Service Builder' screen using default credentials
    Then 'Service Builder' screen should be displayed

  @yammy @ui

  Scenario Outline: Add category on Service Builder Dashboard
    When I click 'Add A New Category' button
    Then 'New Category Wizard' dialog should be displayed

    When I fill 'New Category Wizard' dialog with next values:
      | Name              | <name>             |
      | Short Description | This is test       |
      | Description       | Add a new category |
    And I click 'Next' button in 'New Category Wizard' dialog
    Then 'Assign Domains' message should be displayed in 10 seconds
    When I check rows on 'New Category Wizard' dialog grid which contain next values:
      | Name    |
      | Windows |
    And I click 'Finish' button in 'New Category Wizard' dialog
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

  Scenario Outline: Add specific components to the Test service
    When I click in the 'add16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component |
      | <name>    |
    Then 'Add components to this service' message should be displayed

    When I click 'Add components to this service' link
    Then 'Add components to this service' dialog should be displayed

    When I click 'Add specific component' link
    Then 'Add specific components' dialog should be displayed

    When I check rows on 'Add specific components' dialog grid which contain next values:
      | Name         |
      | #agent_host# |
    And wait 5 seconds
    And I click 'Add Components' button

  Examples:
    | name   |
    | Test   |
    | test   |
    | 1      |
    | .yammy |
    | 珠海虹天   |

  @yammy @ui

  Scenario Outline: Create a rule to include a group of components
    When I click in the 'add16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component |
      | <name>    |
    Then 'Add components to this service' message should be displayed

    When I click 'Add components to this service' link
    Then 'Add components to this service' dialog should be displayed

    When I click 'Create a rule to include a group of components' link
    Then 'Create a rule to include a group of components' dialog should be displayed

    When  I fill 'Create a rule to include a group of components' dialog with next values:
      | Name | TestRule |
    And I click 'Create' button

  Examples:
    | name   |
    | Test   |
    | test   |
    | 1      |
    | .yammy |
    | 珠海虹天   |

  @yammy @ui

  Scenario Outline: Create a global child service
    When I click in the 'add16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component |
      | <name>    |
    Then 'Create a child service' message should be displayed

    When I click 'Create a child service' link
    Then 'New Global Service' message should be displayed

    When I select 'New Global Service' in the 2th '[unnamed]' popup
    Then 'New Global Service' dialog should be displayed

    When  I fill 'New Global Service' dialog with next values:
      | Name              | <childname>  |
      | Short Description | This is test |
      | Description       | This is test |
    And I click 'Next' button
    Then 'Optional - Select the domains to associate with this service category.' message should be displayed

    When I click 'Finish' button

  Examples:
    | name   | childname            |
    | Test   | TestGlobalService    |
    | Test   | testGlobalService    |
    | Test   | 1GlobalService       |
    | Test   | .yammyGlobalService  |
    | Test   | 虹天Global             |
    | test   | TestGlobalService1   |
    | test   | testGlobalService1   |
    | test   | 1GlobalService1      |
    | test   | .yammyGlobalService1 |
    | test   | 虹天Global1            |
    | 1      | TestGlobalService2   |
    | 1      | testGlobalService2   |
    | 1      | 1GlobalService2      |
    | 1      | .yammyGlobalService2 |
    | 1      | 虹天Global2            |
    | .yammy | TestGlobalService3   |
    | .yammy | testGlobalService3   |
    | .yammy | 1GlobalService3      |
    | .yammy | .yammyGlobalService3 |
    | .yammy | 虹天Global3            |
    | 珠海虹天   | TestGlobalService4   |
    | 珠海虹天   | testGlobalService4   |
    | 珠海虹天   | 1GlobalService4      |
    | 珠海虹天   | .yammyGlobalService4 |
    | 珠海虹天   | 虹天Global4            |

  @yammy @ui

  Scenario Outline: Create a local child service
    When I click in the 'add16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component |
      | <name>    |
    Then 'Create a child service' message should be displayed

    When I click 'Create a child service' link
    Then 'New Local Service' message should be displayed

    When I select 'New Local Service' in the 2th '[unnamed]' popup
    Then 'New Service For <name>' dialog should be displayed

    When  I fill 'New Service For' dialog with next values:
      | Name              | <childname>  |
      | Short Description | This is test |
      | Description       | This is test |
    And I click 'Next' button
    Then 'Optional - Select the domains to associate with this service category.' message should be displayed

    When I click 'Finish' button

  Examples:
    | name   | childname           |
    | Test   | TestLocalService1   |
    | Test   | testLocalService1   |
    | Test   | 1LocalService1      |
    | Test   | .yammyLocalService1 |
    | Test   | 虹天LocalService1     |
    | test   | TestLocalService2   |
    | test   | testLocalService2   |
    | test   | 1LocalService2      |
    | test   | .yammyLocalService2 |
    | test   | 虹天LocalService2     |
    | 1      | TestLocalService3   |
    | 1      | testLocalService3   |
    | 1      | 1LocalService3      |
    | 1      | .yammyLocalService3 |
    | 1      | 虹天LocalService3     |
    | .yammy | TestGlobalService4  |
    | .yammy | testLocalService4   |
    | .yammy | 1LocalService4      |
    | .yammy | .yammyLocalService4 |
    | .yammy | 虹天LocalService4     |
    | 珠海虹天   | TestLocalService5   |
    | 珠海虹天   | testLocalService5   |
    | 珠海虹天   | 1LocalService5      |
    | 珠海虹天   | .yammyLocalService5 |
    | 珠海虹天   | 虹天LocalService5     |

  # Add components to the child service
  @yammy @ui

  Scenario: Add specific components to the child service
    When I navigate to 'Test (FSMCategory) -> TestLocalService1 (FSMChildService)' in 'Service Builder' tree
    When I click in the 'add16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component         |
      | TestLocalService1 |
    Then 'Add components to this service' message should be displayed

    When I click 'Add components to this service' link
    Then 'Add components to this service' dialog should be displayed

    When I click 'Add specific component' link
    Then 'Add specific components' dialog should be displayed

    When I check rows on 'Add specific components' dialog grid which contain next values:
      | Name         |
      | #agent_host# |
    And wait 5 seconds
    And I click 'Add Components' button

  @yammy @ui

  Scenario: Create a rule to the child service
    When I navigate to 'Test (FSMCategory) -> TestLocalService1 (FSMChildService)' in 'Service Builder' tree
    When I click in the 'add16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component         |
      | TestLocalService1 |
    Then 'Add components to this service' message should be displayed

    When I click 'Add components to this service' link
    Then 'Add components to this service' dialog should be displayed

    When I click 'Create a rule to include a group of components' link
    Then 'Create a rule to include a group of components' dialog should be displayed

    When  I fill 'Create a rule to include a group of components' dialog with next values:
      | Name | TestChildRule |
    And I click 'Create' button

  @yammy @ui

  Scenario: Create a global child service
    When I navigate to 'Test (FSMCategory) -> TestLocalService1 (FSMChildService)' in 'Service Builder' tree
    When I click in the 'add16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component         |
      | TestLocalService1 |
    Then 'Create a child service' message should be displayed

    When I click 'Create a child service' link
    Then 'New Global Service' message should be displayed

    When I select 'New Global Service' in the 2th '[unnamed]' popup
    Then 'New Global Service' dialog should be displayed

    When  I fill 'New Global Service' dialog with next values:
      | Name              | ChildGlobalChild |
      | Short Description | This is test     |
      | Description       | This is test     |
    And I click 'Next' button
    Then 'Optional - Select the domains to associate with this service category.' message should be displayed

    When I click 'Finish' button

  @yammy @ui

  Scenario: Create a local child service
    When I navigate to 'Test (FSMCategory) -> TestLocalService1 (FSMChildService)' in 'Service Builder' tree
    When I click in the 'add16.png' icon in 'Service Builder' screen tree grid which contain next values:
      | Component         |
      | TestLocalService1 |
    Then 'Create a child service' message should be displayed

    When I click 'Create a child service' link
    Then 'New Local Service' message should be displayed

    When I select 'New Local Service' in the 2th '[unnamed]' popup
    Then 'New Service For TestLocalService' dialog should be displayed

    When  I fill 'New Service For' dialog with next values:
      | Name              | ChildLocalChild |
      | Short Description | This is test    |
      | Description       | This is test    |
    And I click 'Next' button
    Then 'Optional - Select the domains to associate with this service category.' message should be displayed

    When I click 'Finish' button