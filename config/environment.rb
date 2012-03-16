# Load the rails application
require File.expand_path('../application', __FILE__)

config.assets.precompile += %w( bootstrap.css )

# Initialize the rails application
Ludditegames::Application.initialize!
