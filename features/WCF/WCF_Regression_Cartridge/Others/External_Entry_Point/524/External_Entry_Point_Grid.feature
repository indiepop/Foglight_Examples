Feature: Check External Entry Point

  @Bella @wcf
  Scenario: Check External Entry Point
      Given opened 'Dashboards -> WCF Regression -> Others -> External_Entry_Point -> 524 -> Externa Entry Point - grid' screen using default credentials

     And I click the 'About' button
     Then 'This view provides two ways to generate the link to the External Entry Point component. The first and the easiest way (which is recommended to be used most of the time) is by selecting a host and an agent from Drop-Down and respectively from Row Table. The second way (which is for more advanced tasks) is by editing the link manually. After you did you selections/editing, you simply have to click the link. As result, a new page should opened that has a Key-Value component that displays information about the previously selected host and a Tree Table that displays the tree of the previously selected agent.' message should be displayed
     And I close 'About' dialog
     Then I click 'http://yammy_win2k364:8080/console/page/main/system:others_external_entry_point_524.26?hostname=yammy_win2k364&agentname=Windows_System_Windows_System@yammy_win2k364' link
     And wait 10 seconds
     Then I type 'foglight' in 'User' field
     And I type 'foglight' in 'Password' field
     And I click 'Login' button
     And wait 10 seconds
     Then 'Target grid' screen should be displayed




