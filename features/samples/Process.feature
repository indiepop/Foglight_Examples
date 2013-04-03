Feature: Process steps
  To ensure the process steps works properly
  As a step developer

  Scenario: Ensuring message exist in the command line output
    When I receive result from command 'ipconfig'
    Then the message 'IPv4 Address' should exist in console output