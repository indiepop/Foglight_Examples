Feature: Testing GridWcfTable
  In order to test the GridWcfTable component
  As a component developer
  I want make sure the component works properly

  @vivian
  Scenario: Test grid should contains rows
    Given opened 'Dashboards -> Administration -> Agents -> Agent Adapters' screen using default credentials
    And 'Agent Adapters' screen grid should contain next rows:
      | Name  |
      | FglAM |
    * 'Agent Adapters' grid should contain next rows:
      | Name  |
      | FglAM |
#    * 'Agent Adapters' grid should not contain next rows:
#      | Name  |
#      | FglAM |

  Scenario: Test grid contains rows count
    Given opened 'Dashboards -> Administration -> Agents -> Agent Adapters' screen using default credentials
    Then 'Agent Adapters' grid should contain 2 rows

  Scenario: Test check rows and click toolbar button
    Given opened 'Dashboards -> Administration -> Agents -> Agent Adapters' screen using default credentials
    When I check rows on 'Agent Adapters' grid which contain next values:
      | Name  |
      | FglAM |
    And I click the toolbar 'Activate' button in 'Agent Adapters' grid
    And wait 5 seconds

  Scenario: Test click cell
    Given opened 'Dashboards -> Administration -> Agents -> Agent Adapters' screen using default credentials
    When I click the cell in the 3th column in 'Agent Adapters' grid which contain next values:
      | Name  |
      | FglAM |
    And I click the toolbar 'Activate' button in 'Agent Adapters' grid
    And wait 5 seconds
    When I click 'Name' cell in rows in 'Agent Adapters' grid which contain next values:
      | Name     |
      | XML-HTTP |
    And I click the toolbar 'Activate' button in 'Agent Adapters' grid
    And wait 5 seconds

  Scenario: Test click customizer
    Given opened 'Dashboards -> Administration -> Agents -> Agent Adapters' screen using default credentials
    When I click customize in 'Agent Adapters' grid
    And wait 5 seconds


  Scenario: Test drop vscrollbar
    Given opened 'Dashboards -> WCF Regression -> Tables and Trees -> Row-Oriented Table -> 562 -> Row-Oriented Table 4 With Layout' screen using default credentials
    When I drop vscrollbar in 'Row-Oriented Table 4 With Layout' grid to find next values:
      | Name      |
      | jfeng-cc24c5d2f.prod.quest.corp |
    And I click 'Name' cell in rows in 'Row-Oriented Table 4 With Layout' grid which contain next values:
      | Name      |
      | jfeng-cc24c5d2f.prod.quest.corp |
    And wait 5 seconds

  Scenario: Test search field
    Given opened 'Dashboards -> Administration -> Agents -> Agent Adapters' screen using default credentials
    When I search 'FglAM' in 'Agent Adapters' grid
    And wait 5 seconds

  Scenario: Test click toolbar button
    Given opened 'Dashboards -> Administration -> Agents -> Agent Adapters' screen using default credentials
    When I check rows on 'Agent Adapters' grid which contain next values:
      | Name  |
      | FglAM |
    And I click the toolbar 'Deactivate' button in 'Agent Adapters' grid
    And wait 5 seconds

    When I check rows on 'Agent Adapters' grid which contain next values:
      | Name  |
      | FglAM |
    And I click the toolbar 'Activate ' button in 'Agent Adapters' grid
    And wait 5 seconds

  @Lane
  Scenario: Click specific cell with row index and column name
    Given opened 'Dashboards -> Administration -> Credentials' screen using default credentials
    Then 'Credentials' screen should be displayed
    When I click 'Manage Credentials' link
    Then 'Manage Credentials' screen should be displayed
    When I click 'Add' button
    Then '[unnamed]' popup grid should contain next rows:
      | Select the Type of Credential to Add      |
      | Challenge Response                        |
    When I click 'Select the Type of Credential to Add' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Type of Credential to Add      |
      | Challenge Response                        |
    Then 'Add A New "Challenge Response" Credential' dialog should be displayed
    When I click 'Add a New Challenge Response Pair' button
    And I click 'Add a New Challenge Response Pair' button
    And I click 'Challenge' cell on 1st row in 'Add A New "Challenge Response" Credential' dialog grid
    And I type 'test' in inline text editor
    And I click 'Response' cell on 1st row in 'Add A New "Challenge Response" Credential' dialog grid
    And I type 'test' in inline text editor
    And I click 'Challenge' cell on 2nd row in 'Add A New "Challenge Response" Credential' dialog grid
    And I type 'test' in inline text editor
    And I click 'Response' cell on 2nd row in 'Add A New "Challenge Response" Credential' dialog grid
    And I type 'test' in inline text editor
    And wait 10 seconds