# Load the Rails application.

ActionMailer::Base.smtp_settings={
  user_name: 'albion@papelex.net',
  password: 'albionproject1',
  domain: 'gmail.com',
  address: 'smtp.gmail.com',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
