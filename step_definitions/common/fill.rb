And /^you type '(.*)' in '(.+)' field$/ do |value, field_name|
    DwrElement.new(:find,field_name).set_value(value)
end

When /^you type '(.+)' into( .+)? textarea( .+)?$/ do |value, index, scope|
  container_locator = $browser.get_container_locator_by_scope(scope)
  index = index =~ /^(\d+)/ ? index.match(/^(\d+)/).to_s.to_i : 1
  element = DwrElement.new(:locator, "#{container_locator}//textarea[#{index}]")
  element.clear_value
  element.set_value(value)
end