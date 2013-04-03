def assert_result result, expect_result, error_message, expectation = true, raise_exception = true
  begin
    (result == expect_result).should == expectation
    return true
  rescue RSpec::Expectations::ExpectationNotMetError
    if raise_exception
      raise error_message
    else
      return false
    end
  end
end

# possible parameters are 'horizontal' or 'vertical'
def class_for_metric type
  # check for the parameter
  aliases = {
      "horizontal bar"   => HorizontalBar,
      "vertical bar"     => VerticalBar,
      "flow gauge"       => FlowGauge,
      "spinner"          => Spinner,
      "metric indicator" => MetricIndicator,
      "cylinder"         => Cylinder
  }
  aliases[type]
end

# == Description:
#
#   Click the horizontal/vertical bar
#
# == Parameters:
#
#   [String] The name of the bar
#
# == Example:
#
#   When I click 'host status' horizontal bar
#
When /^I click '(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder)$/ do |name, bar_type|
  class_for_metric(bar_type).new(name).click
end

# == Description:
#
#   Assert if the severe of the horizontal/vertical bar is the same as expect
#
# == Parameters:
#
#   [String] The name of the bar
#   [String] Should equal or not
#   [String] The severe of the bar, possible severe are: normal, warn, error, fatal, green, yellow, red
#
# == Example:
#
#   Then the severe of 'host status' horizontal bar should be 'normal'
#   Then the severe of 'disk usage' horizontal bar should not be 'warning'
#
Then /^the severe of '(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder) should( not)? be '(.+)'$/ do |name, metric_type, shouldnot, severe|
  expect_severe = class_for_metric(metric_type).new(name).severe.to_s
  error_message = "Expect severe '#{severe}'#{shouldnot.nil? ? '' : ' should not'} in #{metric_type}, " +
      "but actual severe is '#{expect_severe}'"
  assert_result(expect_severe, severe, error_message, shouldnot.nil?)
end

# == Description:
#
#   Assert if the value of the horizontal/vertical bar is the same as expect
#   the value is on the right top side of the bar
#
# == Parameters:
#
#   [String] The name of the bar
#   [String] Should equal or not
#   [String] The value of the bar
#
# == Example:
#
#   Then the value of 'host status' horizontal bar should be '25'
#   Then the value of 'memory usage' horizontal bar should not be '100 %'
#
Then /^the value of '(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder) should( not)? be '(.+)'$/ do |name, metric_type, shouldnot, value|
  expect_value  = class_for_metric(metric_type).new(name).value.to_s
  error_message = "Expect value '#{value}'#{shouldnot.nil? ? '' : ' should not'} in #{metric_type}, " +
      "but actual value is '#{expect_value}'"
  assert_result(expect_value, value, error_message, shouldnot.nil?)
end

# == Description:
#
#   Assert the value of the horizontal/vertical bar should not appear in the list
#
# == Parameters:
#
#   [String] The name of the bar
#   [Table] The values should not appear in the bar
#
# == Example:
#
#   Then the value of 'host status' horizontal bar should not in the data below:
#     | 20 |
#     | 40 |
#     | 50 |
#     | 80 |
#     | 99 |
#
Then /^the value of '(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder) should not in the (?:data|list) below:$/ do |name, metric_type, table|
  actual_value  = class_for_metric(metric_type).new(name).value.to_s

  table.raw.each do |value|
    error_message = "Expect value '#{value}' should not in #{metric_type}, " +
        "but actual value is '#{actual_value}'"
    assert_result(actual_value, value[0], error_message, false)
  end
end

# == Description:
#
#   Assert the severe of the horizontal/vertical bar should not appear in the list
#
# == Parameters:
#
#   [String] The name of the bar
#   [Table] The severe should not appear in the bar
#
# == Example:
#
#   Then the severe of 'host status' horizontal bar should not in the list below:
#     | error |
#     | fatal |
#
Then /^the severe of '(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder) should not in the (?:data|list) below:$/ do |name, metric_type, table|
  actual_severe  = class_for_metric(metric_type).new(name).severe.to_s

  table.raw.each do |severe|
    error_message = "Expect severe '#{severe}' should not in #{metric_type}, " +
        "but actual severe is '#{actual_severe}'"
    assert_result(actual_severe, severe[0], error_message, false)
  end
end

# == Description:
#
#   Assert if the value and severe of the horizontal/vertical bar is the same as expect
#   *Note:* this step will raise exception if the severe and value are the same (or not) equal as the expectation
#
# == Parameters:
#
#   [String] The name of the bar
#   [String] Should equal or not
#   [String] The value of the bar
#   [String] The severe of the bar
#
# == Example:
#
#   Then 'host status' horizontal bar should be 25% error
#   Then 'network usage' horizontal bar should not be 100% normal
#
Then /^'(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder) should( not)? be (\d+)% (normal|green|error|red|fatal|yellow|warn)$/ do |name, metric_type, shouldnot, value, severe|
  equal_or_not = shouldnot.nil? ? '' : ' not'

  metric = class_for_metric(metric_type).new(name)
  error_message = "The expected value and severe should#{equal_or_not} be '#{value}' #{severe} in #{metric_type}, " +
      "but actual result are '#{metric.value}' #{metric.severe}"

  same_as_expect = (metric.value.to_s == value and metric.severe == severe)
  # if expect equal
  if shouldnot.nil?
    unless same_as_expect
      raise error_message
    end
  # if expect not equal
  else
    if same_as_expect
      raise error_message
    end
  end
end