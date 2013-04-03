require 'helpers'
include FSHelper

# == Parameter
#
#   pass in a table which contains the following parameters:
#
#     from file:    the location of the file you want to copy
#     from machine: the location of the machine
#     to file:      the directory to store the file
#     to machine:   the target machine to receive the file
#
# == Example
#
#   If you are going to copy the file from file "C:/foo.bar" on machine "foo.prod.quest.corp"
#   to file "F:/Downloads/foo.bar" on machine "bar.prod.quest.corp", the step should look like:
#
#   And I copy file by the following parameters
#     | from file    | C:/foo.bar           |
#     | from machine | foo.prod.quest.corp  |
#     | to file      | F:/Downloads/foo.bar |
#     | to machine   | bar.prod.quest.corp  |
#
Given /^I copy file by the following parameters$/ do |parameters|
  params = parameters.rows_hash
  FSHelper.copy replace_string_variant(params['from machine']),
                replace_string_variant(params['from file']),
                replace_string_variant(params['to file']),
                replace_string_variant(params['to machine'])
end

# == Parameter
#
#   Check file or folder existed
#
#   [String] file or folder path
#   [String] type
#   [String] should or not
#
# == Example
#
#   And 'C:/this_is_a_test' folder should not be found
#   And 'C:/xxx.txt' file should be found
#
Then /^'(.+)' (folder|file) should( not)? be found$/ do |name, type, shouldnot|
  begin
    unless file_exist?(@context['host'], name) == shouldnot.nil?
      raise "Error"
    end
  rescue Exception => e
		raise "'#{name}' #{type} should #{shouldnot.nil? ? '' : 'not'} exist"
  end
end