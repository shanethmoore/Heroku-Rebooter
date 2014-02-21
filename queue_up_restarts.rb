require 'sidekiq'
require 'sidetiq'
require './app/workers/heroku_restarter'
time = Time.now.utc
10000.times do
time += (60 * 2)
  HerokuRestarter.perform_at(time)
end
