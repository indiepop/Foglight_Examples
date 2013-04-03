Feature: Testing Popup and PopupMenu  component
  In order to test the Popup and PopupMenu component
  As a component developer
  I want make sure the component works properly

Scenario:Verify Popup is present
  Given opened 'Dashboards->Administration->Credentials' screen using default credentials
   And I click 'Manage Credentials' link
   When I click 'Add' button
  #verfiy no title popup is present
   Then popup should contain next row:
     | DSA Key |


