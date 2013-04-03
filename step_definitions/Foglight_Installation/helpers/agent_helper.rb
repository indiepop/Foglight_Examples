# Create at 2011/07/27
# Create by Lane

module Foglight
	module AgentHelper
		# == parameters
		#    fms_path: foglight Foglight Installation path
		#
		# == example
		#    install_cartridge { "fms_path"  => 'C:/Quest_Software/Foglight/'}
		#
		def create_agent config
			logger.info "Creating #{config['agent_name']} agent"
			
			process = STAF::Process.new 'STAF', config['staf_host']
			variant = STAF::Var.new     'STAF', config['staf_host']
			
			os_type = variant.get :var_name => 'STAF/Config/OS/Name', :scope => 'system'
			logger.info "OS type of FglAM is: " + os_type
			
			executer = (["Linux", "SunOS"].include? os_type) ? "fglcmd.sh" : "fglcmd.bat"
            command  = "#{config['fms_path']}bin/#{executer} -usr foglight -pwd foglight " +
                       "-cmd agent:create -type #{config['agent_type']} -host #{config['agent_host']} " +
                       "-name #{config['agent_name']} -regex -force"

            process.execute :command => command, :params => "WAIT"
		end
		
		def active_agent config
			logger.info "Active agent"
			
			process = STAF::Process.new 'STAF', config['staf_host']
			variant = STAF::Var.new     'STAF', config['staf_host']

			os_type = variant.get :var_name => 'STAF/Config/OS/Name', :scope => 'system'
			logger.info "OS type of FglAM is: " + os_type
    
			executer = (["Linux", "SunOS"].include? os_type) ? "fglcmd.sh" : "fglcmd.bat"
			active_command = "#{config['fms_path']}bin/#{executer} -usr foglight -pwd foglight -cmd agent:activate -all -force"
    
			process.execute :command => active_command, :params => "WAIT"

			logger.info "Active agent complete"
		end
		
		def ensure_agent_created_success config
			logger.info "Confirm #{config['agent_name']} agent was created successfully!"
            result = get_agent_by_name config['fms_path'], config['staf_host'], config['agent_host'], config['agent_name']
			
			unless result
				message = "#{config['agent_name']} was not created successfully."
				logger.warn message
				raise RuntimeError, message
			end
		end
		
		def ensure_agent_actived_success config
			logger.info "Confirm #{config['agent_name']} agent actived successfully!"
		
			process = STAF::Process.new 'STAF', config['staf_host']
			variant = STAF::Var.new     'STAF', config['staf_host']
			
			os_type = variant.get :var_name => 'STAF/Config/OS/Name', :scope => 'system'
			executer = (["Linux", "SunOS"].include? os_type) ? "fglcmd.sh" : "fglcmd.bat"
			
			command = "#{config['fms_path']}bin/#{executer} -usr foglight -pwd foglight -cmd agent:list -host #{config['agent_host']} -active true -type #{config['agent_type']} -name #{config['agent_name']}"
			result = process.execute :command => command,:params => "WAIT STDERRTOSTDOUT RETURNSTDOUT"

			root_obj = result.getRootObject
			data = root_obj['fileList'][0]['data']
			
			if data.to_s.strip.length == 0
				return false
			else
				return true
			end
      
		end

		def ensure_agent_collect_data_success config
			logger.info "Confirm #{config['agent_name']} agent collect data successfully!"
			
			process = STAF::Process.new 'STAF', config['staf_host']
			variant = STAF::Var.new     'STAF', config['staf_host']
			
			os_type = variant.get :var_name => 'STAF/Config/OS/Name', :scope => 'system'
			executer = (["Linux", "SunOS"].include? os_type) ? "fglcmd.sh" : "fglcmd.bat"
			
			command = "#{config['fms_path']}bin/#{executer} -usr foglight -pwd foglight -cmd agent:list -host #{config['agent_host']} -datacollection true -type #{config['agent_type']} -name #{config['agent_name']}"
			result = process.execute :command => command, :params => "WAIT STDERRTOSTDOUT RETURNSTDOUT"
			
			root_obj = result.getRootObject
			data = root_obj['fileList'][0]['data']
			
			if data.to_s.strip.length == 0
				return false
			else
				return true
			end
		end
		
		
		def get_agent_by_name foglight_path, staf_name, agent_host, agent_name
			process = STAF::Process.new 'STAF', staf_name
			variant = STAF::Var.new     'STAF', staf_name

			os_type = variant.get :var_name => 'STAF/Config/OS/Name', :scope => 'system'
			executer = (["Linux", "SunOS"].include? os_type) ? "fglcmd.sh" : "fglcmd.bat"

			command = "#{foglight_path}bin/#{executer} -usr foglight -pwd foglight -cmd agent:list -host #{agent_host} -name #{agent_name}"

			result = process.execute :command => command, :params => "WAIT STDERRTOSTDOUT RETURNSTDOUT"
			root_obj = result.getRootObject

			data = root_obj['fileList'][0]['data']

			return nil if data.to_s.strip.length == 0
			return data
		end	
	end
end	