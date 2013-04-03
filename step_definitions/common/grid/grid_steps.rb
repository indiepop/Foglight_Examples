# get grid or tree grid by object_name, object_type
def get_grid object_name, object_type, grid_type
  $browser.wait_for_body_text

  grid = if object_type.nil?
           object_name ||= "[unnamed]"
           grid_type == "grid" ? GridWcfTable.new(object_name) : TreeWcfTable.new(object_type)
         else
           container = case object_type
                         when "screen"
                           Screen
                         when "panel"
                           Panel
                         when "dialog"
                           Dialog
                         when "popup"
                           Popup
                         when "border"
                           BorderBox
                         when "customizer"
                           Customizer
                       end
           grid_type == "grid" ? container.new(object_name).get_element(GridWcfTable) : container.new(object_name).get_element(TreeWcfTable)
         end

  # return the instance of grid in a specific container
  grid
end

# == Description:
#
#   Navigate element tree in the specify grid|tree grid
#
# == Parameters:
#
#   [String] The element path
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border|customizer
#
# == Example:
#
#    When I navigate 'build template -> CPUs' in '' tree grid
#
# This step is to click on the *Customizer* button near the specified *grid*.
When /^I navigate '(.+)' (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? tree grid$/ do |element_mixpath, object_name, object_type|
  grid = get_grid(object_name, object_type, "tree grid")
  grid.navigate(element_mixpath)
end

When /^I get row by '(.+)' (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? tree grid$/ do |element_mixpath, object_name, object_type|
  grid = get_grid(object_name, object_type, "tree grid")
  grid.get_element(element_mixpath)
end

When /^I click row by '(.+)' (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? tree grid$/ do |element_mixpath, object_name, object_type|
  grid = get_grid(object_name, object_type, "tree grid")
  grid.click_element(element_mixpath)
end

# == Description:
#
#   Select|check|uncheck|toggle rows in the specify grid|tree grid
#
# == Parameters:
#
#   [String] The action of grid rows, it can be select|check|uncheck|toggle
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border|customizer
#   [String] The type of grid, it can be grid|tree grid
#   [Table] The values in the specify grid|tree grid
#
# == Example:
#
#  When I check rows in '' tree grid which contain next values:
#    |              | Name  |
#    | [selected]   | wcf03 |
#    | [unselected] | wcf03 |
#
#  Table template:
#    | Column 1 header    | Column 2 header    | Column n header    |
#    | Row column 1 value | Row column 2 value | Row column n value |
#
When /^I (select|check|uncheck|toggle) rows (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) which contain next values:$/ do |action, object_name, object_type, grid_type, table|
  grid = get_grid(object_name, object_type, grid_type)

  table.hashes.each do |row|
    row.delete_if { |key, value| value.empty? }

    conditions = {}
    row.each { |key, value| conditions.merge!({key => replace_string_variant(value)}) }

    row = grid.get_row(conditions)
    row.get_checkbox.send(:"#{action}")
  end
end

When /^I (check|uncheck|toggle) rows (?:on|in) (\d+)(?:st|rd|th|nd) (grid|tree grid)( .+)? which contain next values:$/ do |action, index, object_type, scope, table|
  $browser.wait_for_body_text
  container_locator = $browser.get_container_locator_by_scope(scope)
  grid = (object_type == "grid") ? GridWcfTable.new("", container_locator, index) : TreeWcfTable.new("", container_locator, index)

  table.hashes.each do |row|
    row.delete_if { |key, value| value.empty? }

    conditions = {}
    row.each { |key, value| conditions.merge!({key => replace_string_variant(value)}) }

    grid.get_row(conditions).get_checkbox.send(:"#{action}")
  end
end

# == Description:
#
#   Check all rows in the specified grid|tree grid
#
# == Parameters:
#
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border|customizer
#   [String] The type of grid, it can be grid|tree grid
#
# == Example:
#
#  When I check all rows in 'Agent Adapters' grid:
#    | Name  |
#    | wcf03 |
#
When /^I check all rows (?:on|in) '(.*)' ?(screen|dialog|box|panel|popup|border|customizer)? (grid|tree grid)$/ do |object_name, object_type, grid_type|
  grid = get_grid(object_name, object_type, grid_type)
  grid.check_all
end

# This step is to click rows in the grid
#
# == Parameters:
#
#   [Int] The index of grid
#   [String] The scope of grid
#   [Table]  The rows need to click
#
# == Example:
#
#   I click rows in the 1st grid which contain next values:
#      | Name         |
#      | Alarm Filter |
#
When /^I click rows in the (\d+)(?:st|nd|td|th) grid( .+)? which contain next values:$/ do |index, scope, table|
  $browser.wait_for_body_text
  container_locator = $browser.get_container_locator_by_scope(scope)
  grid = GridWcfTable.new("", container_locator, index)

  table.hashes.each do |row|
    row.delete_if { |key, value| value.empty? }
    grid.get_row(row).click
  end
end

# == Description:
#
#   Click specified cell in the specified grid|tree grid
#
# == Parameters:
#
#   [String] The title of cell
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border|customizer
#   [String] The type of grid, it can be grid|tree grid
#   [Table]  The rows should appear in the specify grid|tree grid
#
# == Example:
#
#  When I click 'Name' cell in rows in 'Agent Adapters' grid which contain next values:
#    | Name  |
#    | FglAM |
#
# Table template:
#  | Column 1 header    | Column 2 header    | Column n header    |
#  | Row column 1 value | Row column 2 value | Row column n value |
When /^I click '(.*)' cell in rows (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) which contain next values:$/ do |column_title, object_name, object_type, grid_type, table|
  grid = get_grid(object_name, object_type, grid_type)

  table.hashes.each do |row|
    row.delete_if { |key, value| value.empty? }
    if column_title.nil?
      grid.get_row(row).click
    else
      grid.get_row(row).click_cell(column_title)
    end
  end

end

# == Description:
#
#   Click specified cell in the specified grid|tree grid
#
# == Parameters:
#
#   [String] The index of cell
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border|customizer
#   [String] The type of grid, it can be grid|tree grid
#   [Table]  The rows should appear in the specify grid|tree grid
#
# == Example:
#
#  When I click the cell in the 3th column in 'Agent Adapters' grid which contain next values:
#    | Name  |
#    | FglAM |
#
# Table template:
#  | Column 1 header    | Column 2 header    | Column n header    |
#  | Row column 1 value | Row column 2 value | Row column n value |
When /^I click the cell in the (\d+)(?:st|rd|th) column (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) which contain next values:$/ do |index, object_name, object_type, grid_type, table|
  grid = get_grid(object_name, object_type, grid_type)

  table.hashes.each do |row|
    row.delete_if { |key, value| value.empty? }
    grid.get_row(row).click_cell_by_column_index(index.to_i)
  end
end

When /^I set value '(.*)' in the (\d+)(?:st|rd|th) column (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) which contain next values:$/ do |cell_value, index, object_name, object_type, grid_type, table|
  grid = get_grid(object_name, object_type, grid_type)

  table.hashes.each do |row|
    row.delete_if { |key, value| value.empty? }
    grid.get_row(row).click_cell_by_column_index(index.to_i)
    element = Element.new("//div[@id='tableTextCellEditor']//input")
    element.clear_value
    element.set_value(cell_value)
  end
end

# == Description:
#
#   Click *Customizer* button near the specified grid|tree grid
#
# == Parameters:
#
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border
#   [String] The type of grid, it can be grid|tree grid
#
# == Example:
#
#   I click customize in 'Agent Adapters' grid
#
When /^I click customize (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid)$/ do |object_name, object_type, grid_type|
  grid = get_grid(object_name, object_type, grid_type)

  grid.click_customize
end

When /^I click in the '(.+)' icon (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) which contain next values:$/ do |icon_name, object_name, object_type, grid_type, table|
  grid = get_grid(object_name, object_type, grid_type)

  table.hashes.each do |row|
    row.delete_if { |key, value| value.empty? }
    grid.get_row(row).click_icon(icon_name)
  end
end

When /^I click in radio (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) which contain next values:$/ do |object_name, object_type, grid_type, table|
  grid = get_grid(object_name, object_type, grid_type)

  table.hashes.each do |row|
    row.delete_if { |key, value| value.empty? }
    grid.get_row(row).click_radio
  end
end

# == Description:
#
#   Click button on the top of the specify grid|tree grid
#
# == Parameters:
#
#   [String] The title of button
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border
#   [String] The type of grid, it can be grid|tree grid
#
# == Example:
#
#   When I click the toolbar 'Activate' button in 'Agent Adapters' grid
#
When /^I click the toolbar '(.+)' button (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid)$/ do |button_title, object_name, object_type, grid_type|
  grid = get_grid(object_name, object_type, grid_type)
  grid.click_toolbar_button(button_title)
end

# == Description:
#
#   Search text to find rows in the specify grid|tree grid
#
# == Parameters:
#
#   [String] The key value to search
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border
#   [String] The type of grid, it can be grid|tree grid
#
# == Example:
#
#   When I search 'test' in 'Agent Adapters' grid
#      | Name  |
#      | FglAM |
#
When /^I search '(.*)' (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid)$/ do |value, object_name, object_type, grid_type|
  grid = get_grid(object_name, object_type, grid_type)

  grid.set_search_field_value(value)
end

# == Description:
#
#   Drop vscrollbar to find specify rows in the specify grid|tree grid
#
# == Parameters:
#
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border
#   [String] The type of grid, it can be grid|tree grid
#   [Table] The rows should be find
#
# == Example:
#
#   Then I drop vscrollbar in 'Agent Adapters' grid to find next values:
#      | Name  |
#      | FglAM |
#
# Table template:
#  | Column 1 header    | Column 2 header    | Column n header    |
#  | Row column 1 value | Row column 2 value | Row column n value |
And /^I drop vscrollbar (?:on|in) '(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) to find next values:$/ do |object_name, object_type, grid_type, table|
  grid = get_grid(object_name, object_type, grid_type)

  table.hashes.each do |row|
    row.delete_if { |key, value| value.empty? }
    timeout = 200
    if grid.drop_vscrollbar
      until grid.include?(row) || timeout == 1
        grid.drop_vscrollbar
        timeout = timeout - 1
      end
    end

    if timeout == 1 || grid.drop_vscrollbar == false
      raise RuntimeError, "Can't find next values."
    end
  end
end

# == Description:
#
#   Verify some text should appear in the specify grid|tree grid
#
# == Parameters:
#
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border
#   [String] The type of grid, it can be grid|tree grid
#   [String] It can be ''|' not'
#   [Table] The specify text
#
# == Example:
#
#   Then 'Agent Adapters' grid should contain 'FglAM'
#
Then /^'(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) should( not)? contain '(.+)'(?: in (\d+) seconds?)?$/ do |object_name, object_type, grid_type, shouldnot, text, second|
  $browser.wait_for_body_text
  grid = get_grid(object_name, object_type, grid_type)

  second ||= 5
  second = second.to_i
  sleep second
  begin
    grid.get_value(text).is_present? == shouldnot.nil?
  rescue RSpec::Expectations::ExpectationNotMetError
    raise "grid should#{shouldnot.nil? ? '' : ' not'} contain '#{text}'."
  end
end

# == Description:
#
#   Verify some columns should or not appear in the specify grid|tree grid
#
# == Parameters:
#
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border
#   [String] The type of grid, it can be grid|tree grid
#   [String] It can be ''|' not'
#   [Table] The columns should or not appear in the specify grid|tree grid
#
# Table template:
#  | Column 1 header    | Column 2 header    | Column n header    |
#
Then /^'(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) should( not)? contain next columns?( keeping order)?:$/ do |object_name, object_type, grid_type, shouldnot, table|
  $browser.wait_for_body_text
  grid = get_grid(object_name, object_type, grid_type)

  index = 1
  table.raw[0].each do |header|
    begin
      if order.nil?
        grid.include_column?(header).should == shouldnot.nil?
      else
        grid.include_column?(header, index).should == shouldnot.nil?
        index += 1
      end
    rescue RSpec::Expectations::ExpectationNotMetError
      raise "Next header is#{shouldnot.nil? ? ' not' : ''} found#{order.nil? ? '' : " or have index other then #{index}"}: #{header.to_s}."
    end
  end
end

# == Description:
#
#   Verify next rows should or not appear in the specify grid|tree grid
#
# == Parameters:
#
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border
#   [String] The type of grid, it can be grid|tree grid
#   [String] It can be ''|' not'
#   [Table] The rows should or not appear in the specify grid|tree grid
#
# == Example:
#
#   Then 'Agent Adapters' grid should contain next rows:
#     | 20 |
#     | 40 |
#     | 50 |
#     | 80 |
#     | 99 |
#
Then /^'(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) should( not)? contain next rows(?: in (\d+) seconds?)?:$/ do |object_name, object_type, grid_type, shouldnot, second, table|
  $browser.wait_for_body_text
  second ||= 5
  second = second.to_i
  grid = get_grid(object_name, object_type, grid_type)

  if grid.is_present?
    table.hashes.each do |row|
      row.delete_if { |key, value| value.empty? }
      begin
        grid.include?(row, second).should == shouldnot.nil?
      rescue RSpec::Expectations::ExpectationNotMetError
        raise "this #{grid_type} should#{shouldnot.nil? ? '' : ' not'} contains next rows."
      end
    end
  else
    raise "This grid can't be found!"
  end
end

Then /^the (\d+)(?:st|rd|th|nd) grid( .+)? should( not)? contain next rows(?: in (\d+) seconds?)?:$/ do |index, scope, shouldnot, second, table|
  $browser.wait_for_body_text
  second ||= 5
  second = second.to_i
  container_locator = $browser.get_container_locator_by_scope(scope)
  grid = GridWcfTable.new("", container_locator, index)
  if grid.is_present?
    table.hashes.each do |row|
      row.delete_if { |key, value| value.empty? }
      begin
        grid.include?(row, second).should == shouldnot.nil?
      rescue RSpec::Expectations::ExpectationNotMetError
        raise "the grid should#{shouldnot.nil? ? '' : ' not'} contain next rows."
      end
    end
  else
    raise "This grid can't be found!"
  end
end

# == Description:
#
#   Verify next rows should or not appear in the specify tree grid
#
# == Parameters:
#
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border
#   [String] It can be ''|' not'
#   [String] The mixpath in tree grid
#
# == Example:
#
#   Then 'Tree Table 3' tree grid should contain rows by 'beta-vm6 -> Network -> Network Adapter 1'
#
Then /^'(.*)' ?(screen|dialog|panel|popup|border|customizer)? tree grid should( not)? contain rows by '(.+)'$/ do |object_name, object_type, shouldnot, element_mixpath|
  $browser.wait_for_body_text
  grid = get_grid(object_name, object_type, 'tree grid')

  begin
    grid.include_element?(element_mixpath).should == shouldnot.nil?
  rescue RSpec::Expectations::ExpectationNotMetError
    raise "this tree grid should#{shouldnot.nil? ? '' : ' not'} contains rows by '#{element_mixpath}'"
  end
end
# == Description:
#
#   Verify which the specify grid|tree grid should have rows
#
# == Parameters:
#
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be screen|box|panel|popup|border
#   [String] The type of grid, it can be grid|tree grid
#   [String] It can be ''|' not'
#   [Table] The count of the specify grid|tree grid' rows
#
# == Example:
#
#   Then 'Agent Adapters' grid should contain 2 rows
#
Then /^'(.*)' ?(screen|dialog|panel|popup|border|customizer)? (grid|tree grid) should( not)? contain (\d+) rows$/ do |object_name, object_type, grid_type, shouldnot, count|
  $browser.wait_for_body_text
  grid = get_grid(object_name, object_type, grid_type)

  begin
    ((actual_count = grid.rows_count) == count.to_i).should == shouldnot.nil?
  rescue RSpec::Expectations::ExpectationNotMetError
    raise "Expected rows count is#{shouldnot.nil? ? '' : ' not'} #{count}, actual rows count is #{actual_count}."
  end
end

# == Description:
#
#   Click specific cell of specific index row
#
# == Parameters:
#
#   [String] column header of grid
#   [Integer] row index of grid
#   [String] The name of grid or the name fo container
#   [String] The type of container, it can be dialog|panel
#
# == Example:
#
#   I click 'Response' cell on 2nd row in 'Add A New "Challenge Response" Credential' dialog grid
#
When /^I click '(.+)' cell on (\d+)(?:st|nd|rd|th) row in '(.+)' (dialog|panel) grid$/ do |column_name, row_index, object_name, object_type|
  grid = get_grid(object_name, object_type, "grid")

  grid.get_row_index(row_index).click_cell(column_name)
end

# == Description:
#
#   verify the rows in special container should be selected  or should not be select
#
# == Parameters:
#
#   [Int] The index of grid
#   [String] The scope of grid
#   [Table]  The rows need to click
#
# == Example:
#
#  Rows in the 2th grid in 'Script Console' screen should be select which contain next values:
#      |                | Script Name |
#      |[selected]      | test        |
#      |[selected]      | test2      |
#
Then /^Rows? in the (\d+)(?:st|nd|td|th) grid( .+)? should( not)? be select which contain next values:$/ do |index, scope, shouldnot, table|
  $browser.wait_for_body_text
  container_locator = $browser.get_container_locator_by_scope(scope)
  grid = GridWcfTable.new("", container_locator, index)

  table.hashes.each do |row|
    row.delete_if { |key, value| value.empty? }
    begin
      grid.include?(row).should == shouldnot.nil?
    rescue RSpec::Expectations::ExpectationNotMetError
      raise "Rows in the grid should#{shouldnot.nil? ? '' : ' not'} be select."
    end
  end
end

When /^I click on the radio in the (\d+)(?:st|nd|rd|th) (grid|tree grid)( .+)? which contain next rows:$/ do |grid_index, grid_type, scope, table|
  $browser.wait_for_body_text
  container_locator = $browser.get_container_locator_by_scope(scope)
  if grid_type =='grid'
    grid = GridWcfTable.new("", container_locator, grid_index)
    table.hashes.each do |row|
      row.delete_if { |key, value| value.empty? }
      grid.get_row(row).click_radio
    end
  else
    grid = TreeWcfTable.new("", container_locator, grid_index)
    table.hashes.each do |row|
      row.delete_if { |key, value| value.empty? }
      grid.get_row(row).click_radio
    end
  end
end