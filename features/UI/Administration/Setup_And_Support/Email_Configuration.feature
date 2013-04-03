Feature: Check Email configuration on Email Configuration Dashboard
  In order to make sure whether send email successed
  As a Administration
  I want to edit the email configuration

  @yammy @ui

  Scenario: Changing email configuration on Email Configuration Dashboard
    Given opened 'Dashboards -> Administration -> Setup & Support -> Email Configuration' screen using default credentials
    Then 'Email Configuration' screen should be displayed

    When I click in the 'edit16.png' icon in 'Email Server Configuration' panel grid which contain next values:
      | Email Configuration Property |
      | Mail Server (Name or IP) *   |
    Then 'Host name for sending emails' popup should be displayed
    When I type 'relay.prod.quest.corp' into textarea in 'Host name for sending emails' popup
    And I click 'Save' button in 'Host name for sending emails' popup

    When I click in the 'edit16.png' icon in 'Email Server Configuration' panel grid which contain next values:
      | Email Configuration Property |
      | Email Sender Address *       |
    Then 'Sender's email address' popup should be displayed
    When I type 'yammy.chen@quest.com' into textarea in 'Sender's email address' popup
    And I click 'Save' button in 'Sender's email address' popup

    When I click in the 'edit16.png' icon in 'Email Server Configuration' panel grid which contain next values:
      | Email Configuration Property |
      | Username to Login to Server  |
    Then 'Username for mail server login' popup should be displayed
    When I type 'yammy.chen@quest.com' into textarea in 'Username for mail server login' popup
    And I click 'Save' button in 'Username for mail server login' popup

    When I click in the 'edit16.png' icon in 'Email Server Configuration' panel grid which contain next values:
      | Email Configuration Property |
      | Mail Server Port             |
    Then 'Mail server port for sending emails' popup should be displayed
    When I type '25' into 1st input popup
    And I click 'Save' button in 'Mail server port for sending emails' popup

    When I click in the 'edit16.png' icon in 'Email Server Configuration' panel grid which contain next values:
      | Email Configuration Property |
      | User Password                |
    Then 'Password for mail server login' popup should be displayed
    When I type '1' into 1st input popup
    And I type '1' into 2st input popup
    And I click 'Save' button in 'Password for mail server login' popup

    And wait 5 seconds
    And I click 'Test Configuration...' button
    Then 'Test Configuration...' dialog should be displayed
    When I type 'yammy.chen@quest.com' into textarea in 'Test Configuration...' dialog
    And I click 'Send Test Email' button in 'Test Configuration...' dialog
    Then 'Successful' dialog should be displayed

    When I click 'Ok' button in 'Successful' dialog
    And wait 5 seconds
    And I click 'Cancel' button in 'Test Configuration...' dialog
