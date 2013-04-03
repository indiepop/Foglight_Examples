require 'helpers'
require 'pathname'
require 'yaml'

include LogHelper

Before do
  config_root = Pathname.new(File.dirname(__FILE__))

  $workbot_root = config_root.parent.parent.realpath.to_s

  $config  = YAML.load_file("#{config_root}/configure.yml")
  $context = $config
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

