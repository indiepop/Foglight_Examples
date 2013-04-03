# This step is to select *different* menu items from popup or popup menu.
#
# == Parameters:
#
#   [String] The option what you want to select
#   [String] The name of popup menu
#
# == Example:
#
#   I select 'Export as CSV…' from 'Export…' popup menu
#
Then /^I select '(.+)' in (?:the )?(?:(\d+)(?:st|nd|rd|th) )?'(.+)' (popup|popup menu)$/ do |option, index, object_name,object_type|
  index ||= 1
  container = case object_type
                when "popup menu"
                  PopupMenu
                when "popup"
                  Popup
              end
  container.new(object_name,"",index).select(option)
end
