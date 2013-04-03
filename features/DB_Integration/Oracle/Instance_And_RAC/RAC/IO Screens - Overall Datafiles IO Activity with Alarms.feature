Feature: Activity -> Overall Datafiles I/O Activity with Alarms
  in case the alarms appear at the 'Datafiles I/O Summary' grid  Alarms window opens
  As a  administrator role

  @In_progress  @Regression @Smoke @flora
  Scenario:  Overall Datafiles I/O Activity with Alarms
    Given opened 'Dashboards -> Databases -> Databases' screen using default credentials
    And I check rows on 'Databases' screen grid which contains next values:
      | Name                                   |
      | ZHUVMSTAORA10G2.PROD.QUEST.CORP-ORA102 |
    And I click "Home Page" button
    And I click 'Overall Datafiles I/O' button
    Then 'Overall Datafiles I/O Activity' panel should be displayed
  #Click on alarm link in case the alarms appear at the 'Datafiles I/O Summary' grid  Alarms window opens
    And I click '
    Then '1:1 Outstanding Alarm(s) for C:\ORACLE\PRODUCT\10.2.0\ORADATA\ORA102\SYSTEM01.DBF' popup should be displayed
  #  Click on any datafile's name  Verify that the Physical I/O Activity page is opened for chosen datafile and presents the datafile's physical read and writes, plotted over the selected time range, along with the instance physical reads and writes
    And I click 'UNDOTBS01.DBF' link
    Then 'C:\ORACLE\PRODUCT\10.2.0\ORADATA\ORA102\UNDOTBS01.DBF' panel should be displayed
  # Click on the arrow for 'Physical Reads' or 'Physical Writes' charts , chart line change accordingly

    #Click on the 'Back to Datafile I/O' link (top-right side of the screen)
    And I click 'Back to Datafile I/O' link
    # The link leads you back to the 'Overall Datafiles I/O Activity' pane
    Then 'Overall Datafiles I/O Activity' panel should be displayed
   # Click on any datafile's name
    And I click 'SQLEXP01.DBF' link
   # Click on the 'Datafile Storage' link (top-right side of the screen)
    And I click ''Datafile Storage' link
    # The link leads you to Datafile Storage of specific datafile
    Then 'Datafile Properties' panel should be displayed



