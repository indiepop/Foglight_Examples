include LogHelper
include FileHelper

#
# ...
#
#
def init_log machine_name
  unless $context['test_machines'] or $context['test_machines'][machine_name]
    raise "The specific machine '#{machine_name}' not found, please check your configure.yml " +
              "to ensure the machine have been configured properly."
  end

  $context['test_machines'].each do |machine|
    if machine['name'] == machine_name
      if machine['type'] == "normal"
        machine['log'] ||= LogReader.new(machine['host'], machine['log_path'])
      else
        file_path = machine['log_path'] + get_file_name(machine['host'], machine['log_path'], Regexp.new(machine['type']), 1, 'DESC')
        machine['log'] ||= LogReader.new(machine['host'], file_path)
      end
      break
    end
  end

end

#
# ...
#
#
def check_log machine_name, severe = ['ERROR', 'FATAL']
  init_log machine_name

  $context['test_machines'].each do |machine|
    if machine['name'] == machine_name
      log_reader = machine['log']

      log_reader.only_filters = severe
      log_reader.check!

      machine['log'] = log_reader
      break
    end
  end

end

#
# ...
#
#
def check_all_logs severe = ['ERROR', 'FATAL']
  $context['test_machines'].each do |machine|
    init_log machine['host']
    check_log machine['host'], severe
  end
end