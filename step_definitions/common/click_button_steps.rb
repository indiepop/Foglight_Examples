When /^you click (?:the )?(?:(\d+)(?:st|nd|rd|th) )?'(.+)' (button|link|tab|icon)$/ do |index, object_name, object_type|
  index =1
  case object_type
    when "button"
      Button.new(object_name).click
    when "link"
      Link.new(object_name).click
    when "tab"
      Tab.new(object_name).click
    when "icon"
      Icon.new(object_name).click
    else
      raise "Unknown object type: #{object_type}"
  end

end