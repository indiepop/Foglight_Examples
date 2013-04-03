require 'pathname'
$:.unshift(Pathname.new(File.dirname(__FILE__)).parent.realpath)

require 'yaml'
require 'rspec'
require 'json'
require 'gherkin'
require 'cucumber'
require 'rexml/document'
require 'set'
#require 'pg'
require 'time'
require 'core_infrastructure/requires'
require 'helpers'

# Class that make preparation for every scenario to run.

include WCF::Components
include WCF::Utils



class Init
  def self.start
    #$browser = SeleniumUtils.for :remote, :url => "http://localhost:4444/wd/hub", :timeout => $CONFIG['timeout']
    $browser = SeleniumUtils.for :ff

    # maximize the browser and navigate to the login page
    $browser.maximize_window
    $browser.navigate.to $config['server']

    $tid = nil
  end
end