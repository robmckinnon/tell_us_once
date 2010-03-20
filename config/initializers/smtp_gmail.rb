config_file = "#{RAILS_ROOT}/config/smtp_gmail.yml"
raise "Sorry, you must have #{config_file}" unless File.exists?(config_file)

config_options = YAML.load_file(config_file) 

require 'smtp_tls'

ActionMailer::Base.server_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "tellusonce.govtrace.com",
  :authentication => :plain,
}.merge(config_options) # Configuration options override default options
