########################################################################
#
# STEPS FOR COMPONENT DEVELOPMENT
#
########################################################################

def raised_exception? step, table = nil
  begin
    if table
      Then step, table
    else
      Then step
    end
  rescue => e
    p e
    return
  end

  raise "This step should raise exception!"
end

Then /^the severe of '(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder) should( not)? be '(.+)' should raise exception$/ do |name, metric_type, shouldnot, severe|
  raised_exception? "the severe of '#{name}' #{metric_type} should#{shouldnot.nil? ? '' : ' not'} be '#{severe}'"
end

Then /^the value of '(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder) should( not)? be '(.+)' should raise exception$/ do |name, metric_type, shouldnot, value|
  raised_exception? "the value of '#{name}' #{metric_type} should#{shouldnot.nil? ? '' : ' not'} be '#{value}'"
end

Then /^the value of '(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder) should not in the (?:data|list) below: should raise exception$/ do |name, metric_type, table|
  raised_exception? "the value of '#{name}' #{metric_type} should not in the list below:", table
end

Then /^the severe of '(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder) should not in the (?:data|list) below: should raise exception$/ do |name, metric_type, table|
  raised_exception? "the severe of '#{name}' #{metric_type} should not in the list below:", table
end

Then /^'(.+)' (horizontal bar|vertical bar|flow gauge|spinner|metric indicator|cylinder) should( not)? be (\d+)% (normal|green|error|red|fatal|yellow|warn) should raise exception$/ do |name, metric_type, shouldnot, value, severe|
  raised_exception? "'#{name}' #{metric_type} should#{shouldnot.nil? ? '' : ' not'} be #{value}% #{severe}"
end