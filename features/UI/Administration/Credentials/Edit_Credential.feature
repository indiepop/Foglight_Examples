Feature: Edit Credential
  In order to Edit Credentials
  As a system administrator
  I should have a existing credential

  @mark
  Scenario: Edit Credential Properties
    Given opened 'Dashboards->Administration->Credentials' screen using default credentials
    Then 'Credentials' screen should be displayed

    When I click 'Manage Credentials' link
    Then 'Manage Credentials' screen should be displayed

    When I click in the 'edit.png' icon on 'Manage Credentials' screen grid which contain next values:
      | Name          |
      | Administrator |
    Then '[unnamed]' popup grid should contain next rows:
      | Select the Component to Edit |
      | Credential Properties        |

    When I click 'Select the Component to Edit' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Component to Edit |
      | Credential Properties        |
    Then 'Update Credential Properties' dialog should be displayed

    When I fill 'Update Credential Properties' dialog with next values:
      | User Name        | mark     |
      | Password         | abcdefg1 |
      | Confirm Password | abcdefg1 |
    And I click 'Save' button
    Then 'Manage Credentials' screen grid should contain next rows:
      | Lockbox | Name          | Type                                      |
      | System  | Administrator | Domain, User Name, and Password (Windows) |

  Scenario: Edit Credentials Name
    When I click in the 'edit.png' icon on 'Manage Credentials' screen grid which contain next values:
      | Name          |
      | Administrator |
    Then '[unnamed]' popup grid should contain next rows:
      | Select the Component to Edit |
      | Credential Name              |

    When I click 'Select the Component to Edit' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Component to Edit |
      | Credential Name              |
    Then 'Update Credential Name' dialog should be displayed

    When I fill 'Update Credential Name' dialog with next values:
      | Name | Windows_Credential |
    And I click 'Save' button
    Then 'Manage Credentials' screen grid should contain next rows:
      | Lockbox | Name               | Type                                      |
      | System  | Windows_Credential | Domain, User Name, and Password (Windows) |

  Scenario: Edit Resource Mappings
    When I click in the 'edit.png' icon on 'Manage Credentials' screen grid which contain next values:
      | Name               |
      | Windows_Credential |
    Then '[unnamed]' popup grid should contain next rows:
      | Select the Component to Edit |
      | Resource Mappings            |

    When I click 'Select the Component to Edit' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Component to Edit |
      | Resource Mappings            |
    Then 'Update Resource Mappings of Credential: Windows_Credential' dialog should be displayed

    When I click 'Add' button in 'Update Resource Mappings of Credential: Windows_Credential' dialog
    Then 'New Resource Mapping Condition' dialog should be displayed

    When I click 'Target Host Name' link
    And I click '[unnamed]' cell in rows on '[unnamed]' popup grid which contain next values:
      | [unnamed]           |
      | Target Host Address |
    And I click 'Add a New IP Address' button
    And I click 'IP Address' cell on 1st row in 'New Resource Mapping Condition' dialog grid
    And I type '10.30.147.82' in inline text editor
    And I click the 2nd 'Add' button in 'New Resource Mapping Condition' dialog
    And wait 1 seconds
    And I click 'Save' button
    Then 'Manage Credentials' screen grid should contain next rows:
      | Name               | Type                                      |
      | Windows_Credential | Domain, User Name, and Password (Windows) |



