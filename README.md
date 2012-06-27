beta.rb
=======

Beta.rb is a simple API wrapper for [Betaseries](http://www.betaseries.com).

How to use it?
==============

First, you're goind to need an [API key](http://http://www.betaseries.com/api).

Initializing
------------

You need to pass your API key to the Base object like this:
`bs = Beta::Base.new(YOUR_API_KEY)`

You can also set a logger:
`# Enable the logger
Beta::verbose = true # false by default

# And here's how to use it
Beta::log("I am logging this!")`

Users
-----

You can get informations about a specific user.
`user = bs.users.find(USER_LOGIN)`

Then, you can access the informations:
`puts "Login: #{user.login}"
puts "Avatar: #{user.avatar}"
puts "Badges: #{user.badges}"
puts "Stats:\n #{user.stats}"
puts "Shows:\n #{user.shows}"`

But you can also login as a user:
`# Connection
bs.connect(USER_LOGIN, USER_PASSWORD)

# Are you connected?
puts bs.connected? # => true

# Now that you are connected, you can get your informations
puts "I am connected as: #{bs.user.login}"

# Disconnection
bs.disconnect

# Are we still connected after that?
puts bs.connected? # => false`

Shows
-----

Here's how to access shows informations:
`# If we want to get ALL shows
all_shows = bs.shows.all

# If we want a specific show
show = bs.shows.find("doctorwho")
puts "Title: #{show.title}"
puts "Description: #{show.description}"`