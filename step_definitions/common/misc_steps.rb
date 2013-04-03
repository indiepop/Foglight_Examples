# This step is to *wait* specified amount of *seconds* before next action.
# @note Should be avoided.
When /^wait (\d+) seconds$/ do |seconds|
  sleep(seconds.to_i)
end

When /^stop$/ do
  $stop = true
  raise "Execution is stopped."
end

Then /^refresh(?: browser| page)?$/ do
  $browser.refresh
  $browser.wait_for_body_text
end

When /^TestRail id is (\d+)$/ do |tid|
  $tid = tid
end

When /^I refresh the browser$/ do
  $browser.navigate.refresh
end

When /^I navigate to '(.+)' url$/ do |url|
  $browser.navigate.to replace_string_variant(url)
end