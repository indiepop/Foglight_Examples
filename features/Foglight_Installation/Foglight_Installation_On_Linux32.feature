Feature: Setting up Foglight
  In order to use Foglight to monitor the IT infrastructures
  As a system administrator
  I want to install Foglight Management Server

  #
  # Here is the feature file for the new product structure of Foglight
  #

  @yammy @fms
  Scenario: Install Foglight on linux32bit
    Given I have downloaded Foglight installer by the following parameters
      | credential | fogflsw02                                                                                            |
      | from       | /nightly/FoglightServerDist/trunk/*build_number*/linux-ia32/Foglight-5_6_9_999-linux-ia32.tar.gz |
      | to         | /home/yammy/Foglight-5_6_9_999-linux-ia32.tar.gz                                                   |
    When I execute command 'mkdir /home/yammy/Foglight'
    And I execute command 'tar zxvf /home/yammy/Foglight-5_6_9_999-linux-ia32.tar.gz -C #product_installation_path#'
    And I have downloaded license by the following parameters
      | credential | fogflsw01                    |
      | from       | /License/Foglight.license    |
      | to         | /home/yammy/Foglight.license |
    And I start process '/#product_bin_path#/createdb.sh' to create database
    Then I should see 'Successfully shutdown the embedded database' in db start command line in 300 seconds
    When I start process '#product_bin_path#/fms' to start Foglight
    Then I should see 'Forge Server startup completed.' in command line in 1000 seconds
    And I execute command '#product_bin_path#/fglcmd.sh -usr foglight -pwd foglight -cmd license:import -f /home/yammy/Foglight.license' to install license
    # add verification for license
