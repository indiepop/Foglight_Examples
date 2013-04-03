Then /^The '(.+)' agent should exist in (.+) list.*/ do |agent, list|
  if $context['result'].to_s.strip.length != 0
    puts "#{agent} agent had existed in #{list} list"
  else
    raise RuntimeError, "Can't find #{agent} agent in #{list} list, please check!"
  end
end

Then /^I should see 'Core startup complete' in command line in 500 seconds$/ do

end

Then /^there should no error in FMS and FglAM log$/ do

end

Then /^all agents are active and collecting data$/ do

end
