# README
##The most awesome IMDB clone this side of DBC! Project name...Joel's Cupcakes.

### Made by: Thomas Chang, Joel Lebron, Michael Mercuro, Sophia Pignatelli

Joel's Cupcakes is a student project, reproducing the imdb.com website using Ruby on Rails and the omdb api to pull movie information. Users can be created and reviews made on those movies.

I'll be rattling off the gems of what is currently being used in our environment to ensure maximum readability and usage on your side:

- Ruby 2.3.3
- Rails 5.0.2
- Postgres 0.18
- Puma 3.0
- Sass-Rails 5.0
- Uglifier 1.3.0
- jBuilder 2.5
- Devise
- jQuery-Rails

Testing environment utilized a few other gems:

- Byebug
- Rspec-Rails
- Rails-Controller-Testing
- Faker

###Installing Joel's Cupcakes code:

1. Please clone the repo from https://github.com/nyc-foxes-2017/joels_cupcakes

2. Within your local repo, run 'bundle install' to acquire all relevant gems

3. To ensure functionality of database, run 'rails db:create', and 'rails db:migrate'. OPTIONAL: Seed files are currently available for immediate testing of data. Run 'rails db:seed' to load the seed data.

4. Run 'rails server' to create a localhost server of Joel's cupcakes.

5. In your web browser, go to 'localhost:3000' and enjoy your localized version of Joel's cupcakes!

###How to use Joel's Cupcakes:

- Upon accessing the site, users are able to view movies, reviews, and associated comments to the above without having to log in.

- After logging in, users are able to create reviews to movies, and comments to reviews and movies.

- Users will be able to edit and delete their own comments and reviews.



