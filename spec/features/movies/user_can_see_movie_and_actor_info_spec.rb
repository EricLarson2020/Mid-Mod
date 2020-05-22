require "rails_helper"

RSpec.describe "Movie Show Page", type: :feature do
  it "Can display movie and actors info" do

    studio_1 = Studio.create({
      name: "Happy Studio",
      location: "333 Blvd Street"
      })
      movie_1 = Movie.create({
          title: "Happy",
          creation_year: "2011",
          genre: "Comedy",
          studio_id: studio_1.id
          })

      movie_2 = Movie.create({
        title: "Another Comedy",
        creation_year: "2012",
        genre: "Comedy",
        studio_id: studio_1.id
        })

    actor_1 = Actor.create({
        name: "Bob",
        age: 22
      })

    actor_2 = Actor.create({
        name: "Alena",
        age: 20
      })

    actor_3 = Actor.create({
        name: "Fred",
        age: 40
      })

  movie_1.actors << actor_1
  movie_1.actors << actor_2
  movie_2.actors << actors_3

  visit "movies/#{movie_1.id}"
  expect(page).to have_content(movie_1.title)
  expect(page).to have_content(movie_1.creation_year)
  expect(page).to have_content(movie_1.genre)
  expect(page).to have_content(actor_1.name)
  expect(page).to have_content(actor_2.name)
  expect(page).to have_content("Average Age: 21")
  expect(page).not_to have_content(actor_3.name)
  expect(page).not_to have_content(movie_2.title)

  end
end

# As a visitor,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
