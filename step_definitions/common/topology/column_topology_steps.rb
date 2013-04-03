# == Description:
#
#   Hover over topology node icon.
#
# == Parameters:
#
#   [String] label of topology node
#
# == Example:
#
#  When I hover over 'Host - ap11236.prod.quest.corp' topology node icon
#
When /^I hover over '(.+)' topology node icon$/ do |label|
  node = ColumnTopologyNode.new(label)
  node.hover_over_icon
end

# == Description:
#
#   Verify *screen* contain topology items.
#
# == Parameters:
#
#   [String] screen name
#   [String] should equal or not
#   [Table] values and types of topology items
#
# == Example:
#
#   Then 'Tab Column Topology' screen should contain following topology items:
#      | percentSystemTime              | Data Object |
#      | Host - ap11236.prod.quest.corp | Host        |
#      | Network                        | Service     |
#
And /^'(.+)' screen should( not)? contain following topology items:$/ do |object_name, shouldnot_present, table|
  screen = Screen.new(object_name)
  screen.wait

  table.raw.each do |name, type|
    type.downcase!
    begin
      class_name = (type =~ /group box/) ? "topology group" : "topology node"
      node = screen.get_element(class_name, name)

      if shouldnot_present
        (node.is_present? && node.type == type).should == false
      else
        node.is_present?.should == true
        node.name.should == name
        node.type.should == type
      end
    rescue RSpec::Expectations::ExpectationNotMetError
      raise "expect '#{name}' #{type} should#{shouldnot_present.nil? ? '' : ' not'} exist"
    end
  end
end

# This step is to verify column topology node has severe icon
And /^'(.+)' (.+) should have '(.+)' icon$/ do |object_name, type, severe|
  node = ColumnTopologyNode.new(object_name, nil, type)
  begin
    severe.downcase!
    node.severe.should == severe
  rescue RSpec::Expectations::ExpectationNotMetError
    raise "expect '#{object_name}' have #{severe} icon, actual result is: #{node.severe}."
  end
end