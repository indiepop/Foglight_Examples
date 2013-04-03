Given /^go to '(.+)' screen$/ do |screen|
  logged_in = $browser.is_element_present("//div[@id='header']/div[@class='links']/a[text()='Sign Out']")
  if ((not logged_in) && screen != 'Login')
    raise "Can't login to system without credentials specified"
  end
  if (screen != 'Login' && screen != Screen.get_header)
    screens = screen.split('->').map {|element| element.strip}
    collapsible = Collapsible.new(screens.shift)
    collapsible.expand
    tree = collapsible.get_element("tree")
    tree.navigate(screens.join('->'))
    tree.click_element(screens.join('->'))
  end

  # ensure the page open completely
  $browser.wait_for_body_text
end
Given /^go to '(.+)' screen using credentials:/ do |screen,credentials|
  # open the browser if it's not exist
  unless $browser
    Init.start
  end

  logged_in = $browser.is_element_present(signout = "//div[@id='header']/div[@class='links']/a[text()='Sign Out']")
  if (logged_in)
    $browser.find_element(:xpath, signout).click
    # should we need this in Selenium 2?
    #$browser.wait_for_page_to_load
  end
  credentials.rows_hash.each do |key,value|
    And "I type '#{value}' in '#{key}' field"
  end
  When "I click 'Login' button"
  Then "'Grid Layout for Toolbar 1' screen should be displayed"
  Given "go to '#{screen}' screen"
end

Given /^go to '(.+)' screen using (\w+) credentials$/ do |screen,credentials|
  Given "go to '#{screen}' screen using credentials:", table(%{
    | User     | #{$config[credentials]['user']}     |
    | Password | #{$config[credentials]['password']} |
  })
end