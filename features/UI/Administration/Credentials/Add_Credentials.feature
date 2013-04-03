Feature: Add Credentials
  In order to Add Credentials
  As a system administrator
  I should add all types of Credentials

  Background: Go to Manage Credentials dashboards
    Given opened 'Dashboards->Administration->Credentials' screen using default credentials
    Then 'Credentials' screen should be displayed
    When I click 'Manage Credentials' link
    Then 'Manage Credentials' screen should be displayed
    When I click 'Add' button
    Then '[unnamed]' popup grid should contain next rows:
      | Select the Type of Credential to Add      |
      | Challenge Response                        |
      | Domain, User Name, and Password (Windows) |
      | DSA Key                                   |
      | RSA Key                                   |
      | Use Client's Login At Connection Time     |
      | User Name                                 |
      | User Name and Password                    |

  @mark
  Scenario: Add Challenge Response type credential
    When I click 'Select the Type of Credential to Add' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Type of Credential to Add |
      | Challenge Response                   |
    Then 'Add A New "Challenge Response" Credential' dialog should be displayed

    When I fill 'Challenge Response' dialog with next values:
      | User Name | Challenge_Response_Credential |
    And I click 'Add a New Challenge Response Pair' button
    And I click 'Challenge' cell on 1st row in 'Add A New "Challenge Response" Credential' dialog grid
    And I type 'User Name' in inline text editor
    And I click 'Response' cell on 1st row in 'Add A New "Challenge Response" Credential' dialog grid
    And I type 'Administrator' in inline text editor
    And I click 'Next' button
    And wait 1 seconds
    And I click 'Finish' button
    Then 'Manage Credentials' screen grid should contain next rows in 20 seconds:
      | Lockbox | Name                          | Type               |
      | System  | Challenge_Response_Credential | Challenge Response |


  Scenario: Add Domain, User Name, and Password (Windows) type credential
    When I click 'Select the Type of Credential to Add' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Type of Credential to Add      |
      | Domain, User Name, and Password (Windows) |
    Then 'Add A New "Domain, User Name, and Password (Windows)" Credential' dialog should be displayed

    When I fill 'Add A New "Domain, User Name, and Password (Windows)" Credential' dialog with next values:
      | User Name        | Administrator |
      | Password         | rdisfun       |
      | Confirm Password | rdisfun       |
    And I click 'Next' button
    And wait 1 seconds
    And I click 'Finish' button
    Then 'Manage Credentials' screen grid should contain next rows in 200 seconds:
      | Lockbox | Name          | Type                                      |
      | System  | Administrator | Domain, User Name, and Password (Windows) |

  Scenario: Add DSA Key type credential
    When I click 'Select the Type of Credential to Add' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Type of Credential to Add |
      | DSA Key                              |
    Then 'Add A New "DSA Key" Credential' dialog should be displayed

    When I click 'Load from file' link
    And I upload file "*work_dir*/resources/.ssh/id_dsa"
    And I click 'Confirm' button
    And wait 1 seconds

    When I fill 'Add A New "DSA Key" Credential' dialog with next values:
      | User Name | root |
    And I click 'Next' button
    And wait 2 seconds
    And I click 'Finish' button
    Then 'Manage Credentials' screen grid should contain next rows in 200 seconds:
      | Lockbox | Name   | Type    |
      | System  | id_dsa | DSA Key |

  Scenario: Add RSA Key type credential
    When I click 'Select the Type of Credential to Add' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Type of Credential to Add |
      | RSA Key                              |
    Then 'Add A New "RSA Key" Credential' dialog should be displayed

    When I click 'Load from file' link
    And I upload file "*work_dir*/resources/.ssh/id_rsa"
    And I click 'Confirm' button
    And wait 1 seconds

    When I fill 'Add A New "RSA Key" Credential' dialog with next values:
      | Pass Phrase | foglight |
      | User Name   | root     |
    And I click 'Next' button
    And wait 2 seconds
    And I click 'Finish' button
    Then 'Manage Credentials' screen grid should contain next rows in 200 seconds:
      | Lockbox | Name   | Type    |
      | System  | id_rsa | RSA Key |

  Scenario: Add Use Client's Login At Connection Time type credential
    When I click 'Select the Type of Credential to Add' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Type of Credential to Add  |
      | Use Client's Login At Connection Time |
    Then 'Add A New "Use Client's Login At Connection Time" Credential' dialog should be displayed

    When I type 'Connection_Time_Credential' into 1st input on 'Add A New "Use Client's Login At Connection Time" Credential' dialog
    And I click 'Finish' button
    Then 'Manage Credentials' screen grid should contain next rows in 200 seconds:
      | Lockbox | Name                       | Type                                  |
      | System  | Connection_Time_Credential | Use Client's Login At Connection Time |


  Scenario: Add User Name type credential
    When I click 'Select the Type of Credential to Add' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Type of Credential to Add |
      | User Name                            |
    Then 'Add A New "User Name" Credential' dialog should be displayed

    When I fill 'Add A New "User Name" Credential' dialog with next values:
      | User Name | User_Name_Credential |
    And I click 'Next' button
    And wait 1 seconds
    And I click 'Finish' button
    Then 'Manage Credentials' screen grid should contain next rows in 200 seconds:
      | Lockbox | Name                 | Type      |
      | System  | User_Name_Credential | User Name |

  Scenario: Add User Name and Password type credential
    When I click 'Select the Type of Credential to Add' cell in rows on '[unnamed]' popup grid which contain next values:
      | Select the Type of Credential to Add |
      | User Name and Password               |
    Then 'Add A New "User Name and Password" Credential' dialog should be displayed

    When I fill 'Add A New "User Name and Password" Credential' dialog with next values:
      | User Name        | root    |
      | Password         | rdisfun |
      | Confirm Password | rdisfun |
    And I click 'Next' button
    And wait 1 seconds
    And I click 'Finish' button
    Then 'Manage Credentials' screen grid should contain next rows in 200 seconds:
      | Lockbox | Name | Type                   |
      | System  | root | User Name and Password |



