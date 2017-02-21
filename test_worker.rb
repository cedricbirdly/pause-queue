class TestWorker
  include Sidekiq::Worker

  def perform
    if Sidekiq::Queue["dynamicqueue"].paused?
      puts "Queue is paused so worked should not have been launched"
    end
    puts "Executed test worker"
  end
end