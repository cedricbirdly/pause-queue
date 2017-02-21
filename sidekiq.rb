require 'sidekiq'
require 'sidekiq-limit_fetch'
require './test_worker.rb'

Sidekiq.configure_server do |conf|
  conf.server_middleware do |chain|
    chain.remove Sidekiq::Middleware::Server::RetryJobs
  end
  conf.redis = { url: 'redis://127.0.0.1:6379', namespace: 'sidekiq' }
end

Sidekiq.configure_client do |conf|
  conf.redis = { url: 'redis://127.0.0.1:6379', namespace: 'sidekiq' }
end