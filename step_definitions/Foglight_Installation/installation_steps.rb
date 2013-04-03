require 'pathname'
$:.unshift Pathname.new(__FILE__).parent.realpath
require 'erb'
require 'models/foglight_properties'

include Foglight::InstallationHelper

Given /^the FMS install directory is "(.+)"$/ do |install_dir|

end

Given /^I have opened the install properties file '(.+)'$/ do |file|
  @properties_erb_path = replace_string_variant(file)
  @foglight_properties = FoglightProperties.new
end

Given /^change the value of '(.+)' to '(.+)'/ do |key, value|
  setter_method = "#{key.downcase!}="
  if @foglight_properties.respond_to? setter_method
    @foglight_properties.send(setter_method, value)
  else
    raise "Can't find property '#{key}' in Foglight properties file"
  end
end

Given /^I save the file as '(.+)'$/ do |file|
  @properties_path = replace_string_variant(file)

  # delete the properties file if exist
  if File.exist? @properties_path
    File.delete @properties_path
  end

  # save the properties file
  File.open @properties_path, 'w' do |f|
    f.puts ERB.new(File.read(@properties_erb_path)).result(@foglight_properties.get_binding)
  end
end

Given /^Foglight server was installed successfully$/ do

end

Given /^Foglight log file should appear in (\d*) seconds$/ do |second|
  ensure_foglight_log_appear $context['host'], $context['foglight_installation_path'], second.to_i

end

Then /^the installation log should not contains any error or warning$/ do
  check_installation_log $context['host'], $context['foglight_installation_path']
end

Then /^I should see 'Forge Server startup completed.' in command line in (\d*) seconds$/ do |second|
  check_fms_start_log $context['host'], $context['test_machines'][0]['log_path'], second.to_i
end

Then /^I should see '(.+)' in db start command line in (\d*) seconds$/ do |expected_string, second|
  expected_string.gsub!('"', '\"')
  check_fms_database_log $context['host'], $context['test_machines'][0]['log_path'], expected_string, second.to_i
end
