require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq-cron'

SIDEKIQ_STATUS_EXPIRATION = 48.hours.to_i
# Configure Sidekiq server
Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/0' }

  # Schedule cron jobs
  schedule_file = "config/schedule.yml"
  if File.exist?(schedule_file) && Sidekiq.server?
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end

  # config.logger = ActiveSupport::Logger.new(File.join(Rails.root, 'log', 'sidekiq.log'))
end

# Configure Sidekiq client
Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/0' }
  # Sidekiq::Stats.configure_client_middleware(config, 
  #              expiration: SIDEKIQ_STATUS_EXPIRATION)
end
