require 'rails_helper'

RSpec.describe "Stuidos Index Page", type: :feature do
  it "Can see and stuidio and movie names" do
    studio_1 = Studio.create({
      name: "Happy Studio",
      location: "333 Blvd Street"
      })

    studio_2 = Studio.create({
        name: "Scary Studios",
        location: "222 Scary Street"
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

  movie_3 = Movie.create({
    title: "Scary",
    creation_year: "2013",
    genre: "Horror",
    studio_id: studio_2.id
    })

  movie_4 = Movie.create({
    title: "Another Scary",
    creation_year: "2014",
    genre: "Horror",
    studio_id: studio_2.id
    })

  visit "/studios"
  within "studio-#{studio_1.id}" do
    expect(page).to have_content(studio_1.name)
    expect(page).to have_content(movie_1.name)
    expect(page).to have_content(movie_2.name)
    expect(page).not_to have_content(studio_2.name)
    expect(page).not_to have_content(movie_3.name)
  end
  within "studio-#{studio_2.id}" do
    expect(page).to have_content(studio_2.name)
    expect(page).to have_content(movie_3.name)
    expect(page).to have_content(movie_4.name)
    expect(page).not_to have_content(studio_1.name)
    expect(page).not_to have_content(movie_1.name)
  end

  end
end






# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see
# the names of all of its movies.
