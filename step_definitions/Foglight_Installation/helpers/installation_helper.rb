module Foglight
	module InstallationHelper
	
		def install_foglight config
			variants = STAF::Var.new     'STAF', config['staf_host']
			process  = STAF::Process.new 'STAF', config['staf_host']
			
			os_type = variants.get :var_name => 'STAF/Config/OS/Name', :scope => 'system'

			# provide execute privilege
			if ["Linux", "SunOS"].include? os_type
				process.execute :command => "chmod 777 #{config['foglight_path']}", :params => "WAIT"
			end 

			process.execute :command => config['foglight_path'],
							:params => "WAIT PARMS -i silent -f #{config['fms_silent_install_properties_path']}"
							
		end
		
		def check_installation_log host, installation_path
			fs    = STAF::FS.new 'STAF', host
			files = fs.list :path => installation_path, :sort => "DESC"

			# getting the log file name
			log_path = nil
			files.each do |file|
				if file =~ /^Foglight_.*_InstallLog.log$/
					log_path = installation_path + "/" + file
				end
			end

			# raise error if log file not found
			unless log_path
				error_message = "Can not find out the Foglight Installation log in directory: \"#{installation_path}\""

				raise RuntimeError, error_message
			end

			# ensure the following line exist
			#   0 Warnings
			#		0 NonFatalErrors
			#		0 FatalErrors
			#
			pass = true

			['0 NonFatalErrors', '0 FatalErrors', '0 Warnings'].each do |expected_string|
				pass &&= fs.file_contains_str? :file_path => log_path, :expected_string => expected_string
			end

			unless pass
				error_message = "Error was found in the Foglight Installation log, " +
												"please revert the snapshot to check or install again to reproduce"

				raise RuntimeError, error_message
			end
		end
		
		# == Parameters:
		#
		#   config  - the test machine configure
		#   timeout - the startup timeout in second of Foglight Server
		#
		# == Structure of config:
		#
		#   test_machines:
		#     staf:
		#  			name: ZHU12345.prod.quest.corp
		# 		foglight:
		# 			to: C:/Downloads/Foglight-5_5_8-install_windows-x86_64.exe
		# 			installation_path: C:/Quest_Software/Foglight/
		#
		def ensure_fms_start_successfully host, installation_path, timeout = 1000
			process = STAF::Process.new 'STAF', host
			fs      = STAF::FS.new      'STAF', host
			variant = STAF::Var.new     'STAF', host

			log_path = "#{installation_path}/logs/"

			start_time = Time.new.to_i
			timeout.downto(1) do
				begin
					logs = fs.list :path => log_path, :sort => "DESC"
					break unless logs.empty?
				rescue Exception => e
					print '.'
				end

				if Time.new.to_i - start_time > timeout
					error_message "Foglight server startup timeout, the log file did not appear in #{timeout} seconds"
					raise RuntimeError, error_message
				end

				sleep(1)
			end
			timeout = timeout - (Time.new.to_i - start_time)

			# find out log file name
			log_file_name = fs.list(:path => log_path, :sort => "ASC").get_first

			# create log reader for checking the log
			log_reader = LogHelper::LogReader.new(host, (log_path + log_file_name))
			log_reader.only_filters = ["ERROR", "FATAL"]

			is_started = false
			timeout    = timeout
			start_time  = Time.new.to_i
			timeout.downto(1) do
				if fs.file_contains_str? :file_path => log_path + log_file_name,
																 :expected_string => "Forge Server startup completed."
					is_started = true
					break
				end

				# break if timeout
				break if Time.new.to_i - start_time > timeout

				# check log to find if any error
				log_reader.check!

				print '.'
				sleep(1)
			end

			unless is_started
				error_message = "Could not start Foglight server properly, start time out"
				raise Interrupt, error_message
			end
		end
  end
end