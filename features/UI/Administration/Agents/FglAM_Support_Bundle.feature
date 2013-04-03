 @TODO  #UI can not support,PR number is QA-2142
 Feature: Download Agent Manager Support Bundle on FglAM Support Bundle Dashboard
  In order to make sure whether download Agent Manager Support Bundle successed
  As a Administration
  I want to download Agent Manager Support Bundle

  @nancy @ui

  Scenario: Download Agent Manager Support Bundle
    Given opened 'Dashboards -> Administration -> Agents -> FglAM Support Bundle' screen using default credentials
    Then 'Agent Manager Support Bundle' screen should be displayed
    When I click 'supportBundle16a' icon
    Then 'Download Support Bundle' dialog should be displayed
    And wait 100 seconds
    Then 'Support Bundle Generated' dialog should be displayed
    When I click 'Download Bundle' button
    Then 'Opening support_bundle_FglAM' dialog should be displayed
    And I fill 'Opening support_bundle_FglAM' dialog with next values:
     | Save File | on |
    When I click 'OK' button
    Then 'Opening support_bundle_FglAM' dialog should not be displayed