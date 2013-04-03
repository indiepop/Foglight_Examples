require 'helpers'
require 'pathname'
require 'yaml'

include LogHelper

Before do
  $config = YAML.load_file(CONFIG_ROOT + '/configure.yml')

  $workbot_root = Pathname.new(File.dirname(__FILE__)).parent.parent.realpath.to_s

  # the @context will be deprecated, use global variant $context instead
  @context = YAML.load_file("#{$workbot_root}/config/win2k864_2110/configure.yml")
  $context = YAML.load_file("#{$workbot_root}/config/win2k864_2110/configure.yml")
end

After do |scenario|

end

at_exit do
  # Be sure to close the browser if it's still open
  if $browser
    $browser.close
    $browser = nil
  end
end

