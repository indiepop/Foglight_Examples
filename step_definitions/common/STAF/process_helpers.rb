module STAF
  module Helpers

    def build_number path
      root_directory = path.split('*build_number').first
      file_name = FileHelper.get_file_name $context['host'], root_directory, /.*/, 1, 'DESC'
      file_name
    end

    def time_now
      Time.now.strftime("%Y%m%d-%N")
    end

    # return the work directory of the current project
    def work_dir
      $workbot_root
    end
  end
end

include STAF::Helpers

# Replace the variants in the command by the specific tag
#
# == Parameter
#
#   command: the command to be replaced
#
# == Example
#
#   command "C:/server/*now*/foo.exe -q -a --start"
#   replace_command_variant(command)
#
#   # this example will return the updated command by the context
#
#   "C:/server/20120101/foo.exe -q -a --start"
#
#   or
#
#   # if you have configure value in configure.yml as follow:
#       host: win2k3-32
#
#   command "C:/server/#host#/*now*/foo.exe"
#   replace_command_variant(command)
#
#   "C:/server/win2k3-32/20120101/foo.exe -q -a --start"
#
def replace_string_variant command
  matcher = Regexp.new("\\#(.+?)\\#")

  while match_data = matcher.match(command)
    param_name = match_data.captures.first
    command.sub!(Regexp.new("\\##{param_name}\\#"), $context[param_name])
  end

  matcher = Regexp.new("\\*(.+?)\\*")

  while match_data = matcher.match(command)
    param_name = match_data.captures.first

    # some method need parameter for getting the result
    if "build_number" == param_name
      method = "STAF::Helpers.#{param_name}('#{command}')"
    else
      method = "STAF::Helpers.#{param_name}"
    end

    command.sub!(Regexp.new("\\*#{param_name}\\*"), eval(method))
  end

  command
end