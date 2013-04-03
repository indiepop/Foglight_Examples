# This step is to *go* to some *screen* navigating through *left* *menu*.
# @note *screen* can also be *Login*.
Given /^opened '(.+)' screen$/ do |screen|
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

# This step is to *go* to some *screen* navigating through *left* *menu* after logging in with specified *credentials*.
#
# Table template:
#  | User     | some_username |
#  | Password | some_password |
Given /^opened '(.+)' screen using credentials:/ do |screen,credentials|
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
    step "I type '#{value}' in '#{key}' field"
  end
  step "I click 'Login' button"
  step "'Welcome' screen should be displayed"
  step "opened '#{screen}' screen"
end

# This step is to *log* *out*.
When /I logging out/ do
  Link.new('Sign out').click
  $browser.wait_for_page_to_load
end

When /^I close browser$/ do
  if $browser
    $browser.close
    $browser = false
  else
    raise "No browser running "
  end
end

# This step is to *go* to some *screen* navigating through *left* *menu* after logging in with *credentials*
# specified in {file:configuration.yaml}.
Given /^opened '(.+)' screen using (\w+) credentials$/ do |screen,credentials|
  step "opened '#{screen}' screen using credentials:", table(%{
    | User     | #{$config[credentials]['user']}     |
    | Password | #{$config[credentials]['password']} |
  })
end

Given /^logged in using '(\w+)' credentials$/ do |credentials|
  # open the browser if it's not exist
  unless $browser
    Init.start
  end

  step "I type '#{$config[credentials]['user']}' in 'User' field"
  step "I type '#{$config[credentials]['password']}' in 'Password' field"
  step "I click 'Login' button"
end