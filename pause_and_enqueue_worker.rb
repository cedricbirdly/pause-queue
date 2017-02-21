require './sidekiq.rb'

Sidekiq::Queue["dynamicqueue"].pause
Sidekiq::Client.push(
    {
        'class' => TestWorker,
        'queue' => "dynamicqueue",
        'args'  => [],
        'retry' => false
    }
)