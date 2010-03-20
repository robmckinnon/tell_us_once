config_file = "#{RAILS_ROOT}/config/smtp_gmail.yml"
raise "Sorry, you must have #{config_file}" unless File.exists?(config_file)

config_options = YAML.load_file(config_file) 

require 'tlsmail'
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_charset = "utf-8"

ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  :domain          => "todemo@gmail.com",
  :address         => 'smtp.gmail.com',
  :port            => 587,
  :tls             => true,
  :authentication  => :plain
}.merge(config_options) # Configuration options override default options
