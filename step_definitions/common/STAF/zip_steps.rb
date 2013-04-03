include ZipHelper

# == Parameter
#
#   pass in a table which contains the following parameters:
#
#     staf_host:  the staf host server
#     zip_name:   the zip_file_path what you want to unzip
#     to_dir:     the directory to store the file after unzip
#
# == Example
#
#   If you are going to unzip the file "C:/Users/ttan.PROD/Desktop/zgglzd.zip" to folder "D:/zip" the step should look like:
#
#    I unzip file by the following parameters
#    | staf_host |  localhost             |
#    | zip_name  |  C:/Users/ttan.PROD/Desktop/zgglzd.zip |
#    | to_dir    |  D:/zip                |
#
Given /^I unzip file by the following parameters$/ do |params|
  params = params.rows_hash
  unzip :stafhost => $context['host'],
        :zip_name => replace_string_variant(params['from file']),
        :to_dir   => replace_string_variant(params['to dir'])
end

# Same as step "I unzip file by the following parameters"
Given /^I unzip '(.+)' to '(.+)'$/ do |from, to|
  step 'I unzip file by the following parameters', table(%{
    | from file | #{from} |
    | to dir    | #{to}   |
  })
end