# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
url = "http://www.omdbapi.com/?t="

movies = ["the princess diaries", "jumanji", "logan", "power rangers", "good will hunting", "the lion king", "star trek", "rogue one"]


movies.each do |movie|
  adjusted_string = movie.split(" ").join("+")
  movie = JSON.parse open(url + adjusted_string).read
  Movie.create!( { title: movie["Title"], imdbID: movie["imdbID"] } )
end
# users = User.create!([{email: "test@test.com", username: "Test" , password:"password"}])
