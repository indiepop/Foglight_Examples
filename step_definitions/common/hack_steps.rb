# This step is to type value into text box without label
#
# == Parameters:
#
#   [String] The value you want to input
#   [String] The index of input
#   [String] Scope of text box
#
# == Example:
#
#   I type '123' into input in 'New Community String' dialog
#   I type '123' into 1st input in 'New Community String' dialog
#
When /I type '(.+)' into (?:(\d+)(?:st|nd|rd|th) )?input( .+)?/ do |content, index, scope|
  container_locator = $browser.get_container_locator_by_scope(scope)
  index = 1 if index == nil
  input = Input.new('[unnamed]', container_locator, index)
  input.clear_value
  input.set_value(replace_string_variant(content))
end

# This step is to click radio which html structure is not standard
#
# == Parameters:
#
#   [Integer] The index of radio
#   [String] text before radio
#   [String] Scope of radio
#
# == Example:
#
#   I click on the 1st radio after 'Select boolean value:' text in 'New Registry Variable Wizard' dialog
#
When /I click on (?:the )?(?:(\d+)(?:st|nd|rd|th) )?radio after '(.+)' text( .+)?/ do |index, label, scope|
  container_locator = $browser.get_container_locator_by_scope(scope)
  index = 1 if index == nil

  element = Element.new("#{container_locator}//*[contains(text(), '#{label}')]/descendant::input[@type='radio'][#{index}]")
  if element.is_present?
    element.click
  else
    Element.new("#{container_locator}//*[contains(text(), '#{label}')]/following::input[@type='radio'][#{index}]").click
  end
end

# This step is to type value into textarea without label
#
# == Parameters:
#
#   [String] The value you want to input
#   [String] The index of textarea
#   [String] Scope of textarea
#
# == Example:
#
#   I type '123' into textarea in 'Host name for sending emails' popup
#   I type '123' into 1st textarea in 'Host name for sending emails' popup
#
When /^I type '(.+)' into( .+)? textarea( .+)?$/ do |value, index, scope|
  container_locator = $browser.get_container_locator_by_scope(scope)
  index = index =~ /^(\d+)/ ? index.match(/^(\d+)/).to_s.to_i : 1
  element = DwrElement.new(:locator, "#{container_locator}//textarea[#{index}]")
  element.clear_value
  element.set_value(value)
end

# This step is to enter specify iframe
#
# == Parameters:
#
#   [String] The index of iframe
#
# == Example:
#
#   I go to 1st frame
#
When /^I go to (\d+)(?:st|nd|rd|th) frame$/ do |index|
  $browser.switch_to.frame(index.to_i - 1)
end

# This step is to out of specify iframe
#
# == Parameters:
#
#
# == Example:
#
#   I out of frame
#
When /^I out of frame$/ do
  $browser.switch_to.default_content
end

# This step is to select specify item on popup combobox, but not select, it is input.
#
# == Parameters:
#
#   [String] The value itm
#
# == Example:
#
#   And I select 'Movie' item in popup combobox
#
When /^I select '(.+)' item in popup combobox$/ do |item|
  if $browser.wait_for_element_present("//div[@class='popup']/ul[@class='comboboxPopup']//li[text()='#{item}']", 10)
    Element.new("//div[@class='popup']/ul[@class='comboboxPopup']//li[text()='#{item}']").click
  else
    raise "Can't find this #{item} in combobox, please check the item you typed."
  end
end

# This step is to type value into search field in scope.
#
# == Parameters:
#
#   [String] The value
#   [Int] The index of search field
#   [String] The string of search field
#
# == Example:
#
#   When I type 'ryan' into search field in 'User Management' screen
#
When /^I type '(.+)' into (?:(\d+)(?:st|nd|rd|th) )?search field( .+)?$/ do |value, index, scope|
  container_locator = $browser.get_container_locator_by_scope(scope)
  index = 1 if index == nil
  search_field = SearchField.new("", container_locator, index)
  search_field.set_value(value)
end

# This step is to check or uncheck checkbox which html structure is not standard
#
# == Parameters:
#
#   [Integer] The index of checkbox
#   [String] text before checkbox
#   [String] Scope of checkbox
#
# == Example:
#
#   I click on the 1st checkbox Select boolean value:' text in 'New Registry Variable Wizard' dialog
#
When /I (check|uncheck) on (?:the )?(?:(\d+)(?:st|nd|rd|th) )?checkbox after '(.+)' text( .+)?/ do |action, index, label, scope|
  container_locator = $browser.get_container_locator_by_scope(scope)
  index = 1 if index == nil

  element = Element.new("#{container_locator}//*[contains(text(), '#{label}')]/descendant::input[@type='checkbox'][#{index}]")
  if element.is_present?
    element..send(:"#{action}")
  else
    Element.new("#{container_locator}//*[contains(text(), '#{label}')]/following::input[@type='checkbox'][#{index}]").send(:"#{action}")
  end
end