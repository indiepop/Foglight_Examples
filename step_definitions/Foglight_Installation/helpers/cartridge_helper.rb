# Create at 2011/07/27
# Create by Lane

module Foglight
	module CartridgeHelper
		# == parameters
		#    staf_host: staf host
		#    fms_path: foglight Foglight Installation path
		#    car_path: FglAM Installation file path
		#
		# == example
		#    install_cartridge { "staf_host" => '10.30.147.202',
		#						 "fms_path"  => 'C:/Quest_Software/Foglight/',
		#						 "car_path"  => 'C:/Distributed-Monkey-System-1_0_0.car'}
		#
		def install_cartridge config
			process = STAF::Process.new 'STAF', config['staf_host']
			variant = STAF::Var.new     'STAF', config['staf_host']
			os_type = variant.get :var_name => 'STAF/Config/OS/Name', :scope => 'system'
			
			logger.info "Installing FglAM Installation: #{config['car_path']}"
			
			command = "#{config['fms_path']}bin/"
			if ["Linux", "SunOS"].include? os_type
				command += "fglcmd.sh "
			else
				command += "fglcmd.bat "
			end
			command += "-usr foglight -pwd foglight -cmd FglAM Installation:install "
			command += "-f #{config['car_path']}"

			logger.info "Execute command: #{command}"
			process.execute :command => command, :params  => "WAIT"

		end
		# == parameters
		#    staf_host: staf host
		#    fms_path: foglight Foglight Installation path
		#    cartridge_name: FglAM Installation name
		#    sub_cartridges: one FglAM Installation contains one or more sub FglAM Installation
		#
		# == example
		#    check_car_install_success { "staf_host" => '10.30.147.202',
		#								 "fms_path"  => 'C:/Quest_Software/Foglight/',
		#								 "cartridge_name" => 'Distributed-Monkey-System'
		#                                "sub_cartridges" => [ { "cartridge_name" => "DME-Check-It"},
		#													   { "cartridge_name" => "DME-Commom"},
		#													   { "cartridge_name" => "DME-Examine-It"},
		#													   { "cartridge_name" => "DME-Fix-It"},
		#													   { "cartridge_name" => "DME-Landing"},
		#													   { "cartridge_name" => "DME-Predict-It"},
		#												       { "cartridge_name" => "Distributed-Monkey-System"} ]
		#
		def check_car_install_success config
			# ensure the FglAM Installation have installed sucessfully
			cartridges = get_cartridges config['fms_path'], config['staf_host']
				if config['sub_cartridges']
					car_build_number = nil
					config['sub_cartridges'].each do |component|
						found = false
						cartridges.each do |car|
							 if component['cartridge_name'] and car =~ Regexp.new(component['cartridge_name'])
								 found = true
								 car_build_number = get_cartridge_info component['cartridge_name'], cartridges, "Build"
							 end
						end

						if found
							logger.info "Cartriedge #{component['cartridge_name']} was installed sucessfully"
						else
							raise RuntimeError, "Can not find out the FglAM Installation #{component['cartridge_name']} in the FglAM Installation list, " +
																	"please check and be sure this have been installed"
						end
					end
					# add_environment "#{config['cartridge_name']} Build Number", car_build_number
				else
					logger.info "Parameter FglAM Installation not set, no FglAM Installation will be install???"
				end
		end
		
		def deploy_cartridge config
			process = STAF::Process.new 'STAF', config['staf_host']
			variant = STAF::Var.new     'STAF', config['staf_host']
			os_type = variant.get :var_name => 'STAF/Config/OS/Name', :scope => 'system'

			logger.info "Deploying FglAM Installation"

			deploy_command = "#{config['fms_path']}bin/"
            executer = (["Linux", "SunOS"].include? os_type) ? "fglcmd.sh" : "fglcmd.bat"
			deploy_command = "#{config['fms_path']}bin/#{executer} "
			deploy_command += "-usr foglight -pwd foglight -cmd agent:deploy -host #{config['deploy_host']} " + "-allpackages -force"
			logger.info "Execute command to deploy FglAM Installation: #{deploy_command}"
			process.execute :command => deploy_command, :params => "WAIT"
			
			logger.info "Sucessfully deployed FglAM Installation"
		end
		
		# == parameters
		# 	 name, FglAM Installation name
		# 	 car_info_arr, FglAM Installation info array
		# 	 key, the key of FglAM Installation info who named @name
		#
		# 	 @return, value relative key
		#
		# == example
		# 	 get_cartridge_info "OSCartridge", car_info_arr, "Build"
		#
		def get_cartridge_info name, car_info_arr, key
			begin
				car_info_arr.each do |item|
					# single car info array
					single_car_info_arr = item.split(/\n/)
					got_it = false
					value = nil
					single_car_info_arr.each do |element|
						if element =~ /Name:/ && element.split(/:/)[1].chomp.strip == name
							got_it = true;
						end
						if got_it && element =~ /#{key}:/
							value = element.split(/:/)[1].chomp.strip
						end
					end
					return value if got_it
				end
				raise RuntimeError, "Build Number not found!"
			rescue Exception => e
				raise StandardError, "Get Cartridge #{name} build number Error! #{e.message}"
			end
		end

		# == parameters
		# 	 foglight_path, FglAM Installation name
		# 	 staf_name, FglAM Installation info array
		#
		# 	 @return, cartrige list value
		#
		# == example
		# 	 get_cartridges "C:/Quest_Software/Foglight/", 'localhost'
		#
		def get_cartridges foglight_path, staf_name
			process = STAF::Process.new 'STAF', staf_name
			variant = STAF::Var.new     'STAF', staf_name
			os_type = variant.get :var_name => 'STAF/Config/OS/Name', :scope => 'system'
			
			if ["Linux", "SunOS"].include? os_type
				executer = "fglcmd.sh"
			else
				executer = "fglcmd.bat"
			end
			
			get_cartridge_command = "#{foglight_path}bin/#{executer} -usr foglight -pwd foglight -cmd FglAM Installation:list"
			
			result = process.execute :command => get_cartridge_command,
															 :params => "WAIT STDERRTOSTDOUT RETURNSTDOUT"

			a = result.getRootObject
			arr = a['fileList'][0]['data'].split(/------------------------------------/)

			return arr
		end		
	end
end	