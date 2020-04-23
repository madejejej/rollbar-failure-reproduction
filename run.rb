# frozen_string_literal: true

require 'rollbar'
require 'rollbar/plugins/sidekiq'
require 'sidekiq'
require 'sidekiq/cli'
require 'sidekiq/api'

Rollbar.configure do |config|
  config.access_token = '123'
  config.enabled = true
  config.logger = Logger.new($stdout)
  config.logger_level =' info'
  config.use_sidekiq 'queue' => 'default'
  config.net_retries = 1
end

Sidekiq::Queue.new('default').clear
Sidekiq::RetrySet.new.clear
stats = Sidekiq::Stats.new 
stats.reset

begin
  raise RuntimeError, 'test'
rescue => e 
  Rollbar.error(e)
  p e
  p Rollbar
end

loop do
  stats = Sidekiq::Stats.new 
  puts "Processed: #{stats.processed}, Failed: #{stats.failed}, retry size: #{stats.retry_size}, queues: #{stats.queues}" 
  sleep 1
end 
