Heroku-Rebooter
===============

### What?
A standalone application that will restart heroku dynos automatically on a schedule


### Why?

During an absolute headache of a memory leak (100mb a minute), we were forced to restart our dynos every 8-9 minutes manually. This prevented us from sleeping and actually fixing the issue. So I wrote this little bugger to reboot heroku dynos on a minutely basis.
It turned out to be a life saver and meant that although things were broken, they wouldn't be totally smashed on memory leaks.

### How?

Simple. Its a standalone rails app that you boot up and leave it. It will log into heroku on your behalf and restart the app (or a specific dyno type) every so and so minutes.
Its a handy little tool that I hope you never have to use but if you're reading this, then you're probably in the same boat.


### TL;DR
This app restarts heroku dynos for you.


## Requirements ##
* Redis
* Ruby 1.9.3 or higher (Total BS. I have no idea what ruby version is the min for this tool)


## Installing Redis ##

Debian based Linux
```
sudo apt-get install redis-server
```

Mac
```
brew install redis
```



## How to use ##

After installing redis, go to the root directory of the app

```
bundle install
```

Then once the bundle is setup and ready, its time to setup your env vars
```
export HEROKU_USERNAME=my_heroku_username@whatever.com
export HEROKU_PASSWORD=password
export REFRESH_TIME=5 #Time in minutes which the app should restart
export TARGET_APP_NAME=my-heroku-app
export HEROKU_PS_TYPE=web.2 #Optional

```

Then just run it
```
be sidekiq
```


## Final Steps ##

Whatever reason you have for needing to restart your app every once in a while, go an fix it.

