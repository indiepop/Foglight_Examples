require "staf_controller"
require 'helpers/vm_helper'
require "helpers"
require 'workbot/report/generators/html_generator'

include Workbot
include Workbot::Report::Generators
include MailHelper
include VmHelper

# adding environment info
#require "environment_info"

# generate report for report server
report_template_path = "#{WORKBOT_GEM_ROOT}/lib/workbot/report/templates/foglight.html.erb"
HtmlGenerator.generate(@runner.working_path, report_template_path, "report.html")

# generate report for email
report_template_path = "#{WORKBOT_ROOT}/resources/template_for_email_report.html.erb"
HtmlGenerator.generate(@runner.working_path, report_template_path, "foglight_email.html")

# load the mailing config
mail_config = YAML.load_file("#{CONFIG_ROOT}/mail.yml")

# send email
report_subject = "#{@test_name} - #{@runner.run_on} #{@runner.run_at}"
report_content = IO.read(@runner.working_path + "/foglight_email.html")
send_email mail_config, report_content, report_subject

process = STAF::Process.new 'STAF', "localhost"

# close the vm
vm_config = {:url => 'https://zhuvcradw02.prod.quest.corp/sdk',
             :username => 'ychen',
             :password => 'CYZ_5910',
             :vm_folder => '26 FG',
             :vm_name => 'Fog_2612_CentOS62_x64'}

vm = connect_vm vm_config

power_off_vm vm