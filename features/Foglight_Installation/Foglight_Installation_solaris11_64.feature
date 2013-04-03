<<<<<<< .mine
Feature: Setting up Foglight
  In order to use Foglight to monitor the IT infrastructures
  As a system administrator
  I want to install Foglight Management Server

  #
  # Here is the feature file for the new product structure of Foglight
  #

  @yammy @fms
  Scenario: Install Foglight on solaris11 64bit
    Given I have downloaded Foglight installer by the following parameters
      | credential | fogflsw02                                                                                                |
      | from       | /nightly/FoglightServerDist/trunk/*build_number*/solaris-x86_64/Foglight-5_6_9_999-solaris-x86_64.tar.gz |
      | to         | /home/yammy/Foglight-5_6_9_999-solaris-x86_64.tar.gz                                                     |
    When I execute command 'mkdir /home/yammy/Foglight'
    And I execute command 'tar zxvf /home/yammy/Foglight-5_6_9_999-solaris-x86_64.tar.gz -C #product_installation_path#'
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
=======
Feature: Setting up Foglight
  In order to use Foglight to monitor the IT infrastructures
  As a system administrator
  I want to install Foglight Management Server

  #
  # Here is the feature file for the new product structure of Foglight
  #

  @yammy @fms
  Scenario: Install Foglight on solaris11_64
    Given I have downloaded Foglight installer by the following parameters
      | credential | fogflsw02                                                                                            |
      | from       | /nightly/FoglightServerDist/trunk/*build_number*/solaris-x86_64/Foglight-5_6_9_999-solaris-x86_64.tar.gz |
      | to         | /test/yammy/Foglight-5_6_9_999-solaris-x86_64.tar.gz                                               |
    When I execute command 'mkdir /test/yammy/Foglight'
    And I execute command 'tar zxvf /test/yammy/Foglight-5_6_9_999-solaris-x86_64.tar.gz -C #product_installation_path#'
    And I have downloaded license by the following parameters
      | credential | fogflsw01                    |
      | from       | /License/Foglight.license    |
      | to         | /test/yammy/Foglight.license |
    And I start process '/#product_bin_path#/createdb.sh' to create database
    Then I should see 'Successfully shutdown the embedded database' in command line in 300 seconds
    When I start process '#product_bin_path#/fms' to start Foglight
    Then I should see 'Forge Server startup completed.' in command line in 1000 seconds
    And I execute command '#product_bin_path#/fglcmd.sh -usr foglight -pwd foglight -cmd license:import -f /test/yammy/Foglight.license' to install license
    # add verification for license
>>>>>>> .r1180
