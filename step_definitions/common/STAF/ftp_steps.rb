require 'rubygems'
require 'workbot'

include DownloadHelper

# == Parameter
#
#   [table]: download parameters
#
# == Example
#
#   And I have downloaded Foglight installer by the following parameters
#      | protocol  | ftp                                                                                                                 |
#      | server    | fogflsw01.prod.quest.corp                                                                                           |
#      | user name | foglight                                                                                                            |
#      | password  | foglight                                                                                                            |
#      | from      | /nightly/FoglightServerDist/branches/GHOSTRIDER/*build_number*/windows-ia32/Foglight-5_6_3-install_windows-ia32.exe |
#      | to        | C:/Foglight-5_6_3-install_windows-ia32.exe                                                                          |
#
Given /^I have downloaded .* by the following parameters$/ do |table|
  begin
    params = table.rows_hash
    conditions = {}

    if params.has_key?('credential')
      conditions.merge!($context[params['credential']])
    end

    params.each_pair do |key, value|
      value = key == "from" ? value : replace_string_variant(value)
      conditions.merge!({ key => value })
    end
    conditions.merge!({'staf host' => replace_string_variant($context['host'])})

    download conditions
  rescue Exception => e
    Cucumber.wants_to_quit = true
    raise Interrupt, "#{e.message}\n" + e.backtrace.join('\n')
  end
end

