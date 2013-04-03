# This step is to *type* into textbox or *select* from dropdown.
And /^I select '(.*)' in (?:the )?(?:(\d+)(?:st|nd|rd|th) )?'(.+)' field( .+)?$/ do |value, index, field_name, scope|
  container_locator = $browser.get_container_locator_by_scope(scope)
  index ||= 1
  Select.new(field_name, container_locator, index).set_value(value)
end

Then /(?:The )?(?:(\d+)(?:st|nd|rd|th) )?'(.+)' (?:select|drop list|combobox)? should( not)? contain next values:/ do |index, title, shouldnot, table|
  select = Select.new(title, nil, index)
  table.raw.each do |value|
    begin
      select.contain_value?(value).should == shouldnot.nil?
    rescue RSpec::Expectations::ExpectationNotMetError
      raise "The #{index} combobox should#{shouldnot.nil? ? '' : ' not'} contains value #{value}."
    end
  end
end