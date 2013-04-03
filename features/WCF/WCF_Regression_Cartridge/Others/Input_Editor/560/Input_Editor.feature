Feature: Check Input Editor

  @Bella @wcf
  Scenario: Check Input Editor
      Given opened 'Dashboards -> WCF Regression -> Others -> Input Editor -> 560 -> Main as Page' screen using default credentials

    And I click 'popup.png' icon
    Then I navigate 'Global Time Ranges -> Last 24 hours' in 'Select Common:Time Range' popup tree grid
    #And I select 'Last 24 hours' in 'Select Common:Time Range' popup
    And I click 'Design' tab

    And I click 'editItem.png' icon
    Then I select 'String' in '[unnamed]' popup
    Then I type 'abc' into 'input_value' textarea
    And I click the 'Set' button
    And wait 10 seconds

    And I click 'Submit' button
    Then '<context><entry key="timeRange"><lastn-time-range unit="hour" num-units="4" granularity="-1"/></entry><entry key="result"><string xml:space="preserve">abc</string></en' message should be displayed





