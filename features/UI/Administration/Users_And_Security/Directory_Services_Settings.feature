Feature: Configure directory services on Users_And_Security Dashboard
  In order to test this function
  As a Administration
  I want to configure directory services

  @yammy @ui
  Scenario: Configure directory services on Users_And_Security Dashboard
    Given opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    Then 'Users & Security Management' screen should be displayed

    When I click 'Directory Services Settings' link
    Then 'Configure Directory Services' screen should be displayed

    When I click 'Edit' button on 'LDAP Locations' panel
    Then 'URLs Editor' dialog should be displayed

    When I fill 'URLs Editor' dialog with next values:
      | Nearest LDAP server URL   | ldap://torgdcw01.prod.quest.corp:389/ |
      | Secondary LDAP server URL | ldap://halgdcw01.prod.quest.corp:389/ |
    And I click 'Test' button in 'URLs Editor' dialog
    Then 'LDAP URL Availability Status' dialog should be displayed
    And 'LDAP server is up.' message should be displayed

    When I click 'Close' button in 'LDAP URL Availability Status' dialog
    Then 'Nearest LDAP server URL' message should be displayed
    And I click 'Save' button in 'URLs Editor' dialog
    And wait 5 seconds
    And I click 2nd 'Edit' button
    Then 'Settings Editor' dialog should be displayed

    When I fill 'Settings Editor' dialog with next values:
      | Distinguished name of the service account  | CN=svc-ADSInteg,OU=Enabled SVC-Accounts,OU=SVC-Accounts,OU=IS,DC=prod,DC=quest,DC=corp |
      | Password                                   | 6Sixthnum                                                                              |
      | Confirm Password                           | 6Sixthnum                                                                              |
      | LDAP query prefix                          | CN=                                                                                    |
      | LDAP query suffix                          | ,OU=Employees,DC=prod,DC=quest,DC=corp                                                 |
      | The scope(s) to search for groups          | OU=Groups,DC=prod,DC=quest,DC=corp                                                     |
      | The second group namespace                 | OU=Dynamic Groups,DC=prod,DC=quest,DC=corp                                             |
      | The LDAP context for user searching        | ou=Employees,DC=prod,DC=quest,DC=corp                                                  |
      | Role attribute ID                          | name                                                                                   |
      | User alias attribute ID                    | sAMAccountName                                                                         |
      | User attribute ID to search for groups     | member                                                                                 |
      | JAAS LoginModule Name                      | com.quest.nitro.service.security.auth.spi.NitroExtendedLdapLoginModule                 |
      | Name of JAAS security domain               | fgl-web-console                                                                        |
      | Parent group attribute ID                  | memberOf                                                                               |
      | Group attribute for nested group searching | member                                                                                 |
      | Maximum level of group nesting             | 15                                                                                     |
      | LDAP search timeout (milliseconds)         | 10000                                                                                  |
      | Mode of group searching                    | direct                                                                                 |
    And I click 'Save' button in 'Settings Editor' dialog
    And I fill 'Configure Directory Services' screen with next values:
      | Enable LDAP[right] | on |
    And wait 10 seconds
    And  I click 'Sign Out' link
    And wait 10 seconds
    Then 'You have been logged out' message should be displayed

    When I type 'mliu' in 'User' field
    And I type 'Lmoon12345' in 'Password' field
    And I click 'Login' button
    Then 'The user mliu was imported successfully but you cannot log in until an administrator grants the necessary permissions. Please contact your administrator.' message should be displayed in 200 seconds

   When I click 'log in as another user?' link
    And wait 10 seconds
    When opened 'Dashboards -> Administration -> Users & Security' screen using default credentials
    And I click 'Manage Users, Groups, Roles' link
    Then 'User Management' screen grid should contain next rows:
      | Name |
      | mliu |

    When I click 'Roles' cell in rows in 'User Management' screen grid which contain next values:
      | Roles           |
      | Assign roles... |
    Then '[unnamed]' popup should be displayed

    When I check rows on '[unnamed]' popup grid which contain next values:
      | Role Names    |
      | Administrator |
      | Console User  |
    And I click 'Save' button
    And wait 10 seconds
    And  I click 'Sign Out' link
    Then 'You have been logged out' message should be displayed

    When I type 'mliu' in 'User' field
    And I type 'Lmoon12345' in 'Password' field
    And I click 'Login' button
    Then 'Welcome' screen should be displayed





