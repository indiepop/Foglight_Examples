# This step is to click on control buttons on top-right corner of dialog or panel.
#
# == Parameters:
#
#   [String] The control button what you want to click
#   [String] The name of dialog or panel
#
# == Example:
#
#   I Close 'Rule Service' panel
#
When /^I (maximize|restore|close|expand|collapse|help) '(.+)' (dialog|panel)$/ do |button_title, container_name,container_type|
  $browser.wait_for_body_text
  contain = case container_type
              when "dialog"
                Dialog.new(container_name)
              when "panel"
                Panel.new(container_name)
              else
                  raise "Unknown container type '#{container_type}'"
            end
  contain.click_control_button(button_title.capitalize)
end

# This step is to click *chart* inside specified container.
#
# == Parameters:
#
#   [String] The name of chart
#   [String] The name of object
#   [String] The type of object
#
# == Example:
#
#   I click chart in 'Rule Service' panel
#
Then /^I click(?: '(.+)')? chart (?:on|in) '(.+)' (.+)$/ do |chart_name, container_name, container_type|
  container = case container_type
                when "screen"
                  Screen.new(container_name)
                when "panel"
                  Panel.new(container_name)
                when "border"
                  BorderBox.new(container_name)
                else
                  raise "Unknown container type '#{container_type}'"
              end
  container.get_element(Chart, chart_name).click
end