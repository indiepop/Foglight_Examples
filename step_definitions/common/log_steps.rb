# == Description:
#
#   Start monitoring log on specify machine
#
# == Parameters:
#
#   [String] The name of specify machine need check log
#
# == Example:
#
#   When I start monitoring log on machine 'FMS'
#
When /^I start monitoring log on machine '(.+)'/ do |machine_name|
  init_log machine_name
end

# == Description:
#
#   check if machine contain error information
#
# == Parameters:
#
#   [String] The name of specify machine need check log
#   [String] The error information
#
# == Example:
#
#   Then machine 'FMS' should not contain ERROR,FATAL in log
#
Then /^machine '(.+)' should not contain (.+) in log$/ do |host_name, severe|
  severe = severe.split(',')
  #check_log(host_name, severe)
end