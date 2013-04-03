Feature: Setting up Foglight
  In order to use Foglight to monitor the IT infrastructures
  As a system administrator
  I want to install Foglight Management Server

#
# Here is the feature file for the new product structure of Foglight
#

  @yammy @fms
  Scenario: Install Foglight on windows32bit
    Given I have downloaded Foglight installer by the following parameters
      | credential | fogflsw02                                                                                             |
      | from       | /nightly/FoglightServerDist/trunk/*build_number*/windows-ia32/Foglight-5_6_9_999-windows-ia32.zip |
      | to         | C:/Foglight-5_6_9_999-windows-ia32.zip                                                              |
    And I unzip 'C:/Foglight-5_6_9_999-windows-ia32.zip' to '#product_installation_path#'
    And I have downloaded license by the following parameters
      | credential | fogflsw01                 |
      | from       | /License/Foglight.license |
      | to         | C:/Foglight.license       |
    And I start process '#product_bin_path#/createdb.bat' to create database
    Then I should see 'Successfully shutdown the embedded database' in db start command line in 300 seconds
    When I start process '#product_bin_path#/fms.exe' to start Foglight
    Then I should see 'Forge Server startup completed.' in command line in 1000 seconds
    And  I execute command '#product_bin_path#/fglcmd.bat -usr foglight -pwd foglight -cmd license:import -f C:/Foglight.license' to install license
# add verification for license
