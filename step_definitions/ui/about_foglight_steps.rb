include ReportHelper

When /^receive the information from 'More Info' dialog and save to the test report$/ do
  locator = Dialog.new('More Info').get_locator + "/div[@class='body']/div/div"
  elements = $browser.find_elements(:xpath, locator)

  item_count = 8
  0.upto(item_count - 1) do |index|
    key = elements[index * 2].text.gsub(':', '')
    value = elements[index * 2 + 1].text

    add_environment key, value
  end
end

#
# When receive the following cartridges information and save to the test report
#   | IntelliProfile |
#   | OS-ApacheSvr   |
#   | OS-AppMonitor  |
#
When /^receive the following cartridges information and save to the test report$/ do |list|
  cartridges = list.raw.collect { |element| element.to_s }
  grid = GridWcfTable.new("", Screen.new("Cartridge Inventory").get_locator, 1)

  cartridges.each do |cartridge|
    row = {"Cartridge Name", cartridge}
    unless grid.include?(row)
      raise "This cartridge #{cartridge} is not fond in Installed Cartridges list."
    else
      add_environment "#{cartridge} Version", grid.get_row(row).get_cell_value_by_title("Version")
    end
  end
end

#
# When I save browser information to the test report
#
When /^I save (.+) information to the test report$/ do |key|
  if $context[key]
    add_environment key, $context[key]
  else
    raise "Can't find #{key} information in configure.yml file."
  end

end