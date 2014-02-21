ENV['HEROKU_USERNAME'] ||= "someguy@somewhere.com"
ENV['HEROKU_PASSWORD'] ||= "password"
ENV['REFRESH_TIME'] ||= "5"
ENV['TARGET_APP_NAME'] ||= "my-heroku-app-name"

class HerokuRestarter
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely(ENV['REFRESH_TIME'].to_i) }

  def perform(*dummy_args)
    heroku = Heroku::Client.new(ENV['HEROKU_USERNAME'], ENV['HEROKU_PASSWORD'])


    if ENV['HEROKU_PS_TYPE']
      # If there is a type of process you wish to restart, you can restart it specifically
      # heroku.ps_restart("my-heroku-app", 'ps' => 'web.1') #
      # heroku.ps_restart("my-heroku-app", 'ps' => 'web')   #all web dynos
      heroku.ps_restart(ENV['TARGET_APP_NAME'], 'type' => ENV['HEROKU_PS_TYPE'])
    else
      heroku.restart(ENV['TARGET_APP_NAME'])
    end
  end
end
