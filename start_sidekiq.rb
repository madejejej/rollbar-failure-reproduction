require 'rollbar'

Rollbar.configure do |config|
  config.access_token = '123'
  config.enabled = true
  config.use_sidekiq 'queue' => 'default'
  config.net_retries = 1
end
