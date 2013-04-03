# == Parameter
#
#   command: pass the command that you are going to execute
#
# == Example
#
#   you can also pass in the note or purpose at the end of the command like:
#     When I execute command 'ls /home/foo' to list all files under /home/foo
#
# == Note
#
#   this step will wait for the command finish
#
When /^I execute command '(.+)'.*/ do |command|
  STAF::Process.new('STAF', $context['host']).execute :command => replace_string_variant(command),
                                                      :params  => "WAIT"
end

# == Parameter
#
#   command: pass the command that you are going to execute
#
# == Example
#
#   you can also pass in the note or purpose at the end of the command like:
#     When I start daemon process by command '/home/foo/Foglight/bin/fms' to start Foglight
#
# == Note
#
#   this step will *not* wait for the command finish
#
When /^I start daemon process by command '(.+)'.*/ do |command|
  STAF::Process.new('STAF', $context['host']).execute :command => replace_string_variant(command),
                                                      :params  => "WORKLOAD close_windows"
end

When /^I start process '(.+)'.*/ do |command|
  step "I start daemon process by command '#{command}'"
end

# == Parameter
#
#   command: pass the command that you are going to execute
#
# == Example
#
#   you can also pass in the note or purpose at the end of the command like:
#     When I receive result from command 'ifconfig'
#
# == Note
#
#   this step will *not* wait for the command finish
#   the result (STDOUT) will be saved as String type in the context of the current feature
#
When /^I receive result from command '(.+)'.*/ do |command|
  result = STAF::Process.new('STAF', $context['host']).execute :command => replace_string_variant(command),
                                                               :params  => "WAIT STDERRTOSTDOUT RETURNSTDOUT"
  $context['result'] = result.getRootObject['fileList'][0]['data']
end

# == Parameter
#
#   message: [String] the message should exist in the previous command output
#
# == Example
#
#   use the command execution step first and use this step, for example, you need to ensure the host name
#   of test machine is "ZHU10850"
#     When I receive result from command "hostname"
#     Then the message 'ZHU10850' should appear in console output
#
Then /^the message '(.+)' should (?:exist|appear) in console output$/ do |message|
  begin
    $context['result'].include?(message).should == true
  rescue RSpec::Expectations::ExpectationNotMetError
    raise "The expected message '#{message}' did not appear in the console output"
  end
end



