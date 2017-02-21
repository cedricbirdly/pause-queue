require './sidekiq.rb'

Sidekiq::Queue["dynamicqueue"].unpause