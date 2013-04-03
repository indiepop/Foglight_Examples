# This step is to *click* on *icon*.
# @note this icon click in transparent.gif
When /^I click (?:the )?(?:(\d+)(?:st|nd|rd|th) )?"(.+)" icon$/ do |index, object_name|
  index ||= 1
  Element.new("//descendant-or-self::span[@title='#{object_name}'][#{index}]/img[contains(@src,'transparent.gif')]").click
end