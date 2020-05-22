require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe "relationships" do
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe "class_methods" do
    it "average_age" do


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
      average_age_of_actors = Actor.average_age.round(1)
      expect(average_age_of_actors).to eql(27.3)
    end

    # it "sort_actors" do
    #   studio_1 = Studio.create({
    #     name: "Happy Studio",
    #     location: "333 Blvd Street"
    #     })
    #     movie_1 = Movie.create({
    #         title: "Happy",
    #         creation_year: "2011",
    #         genre: "Comedy",
    #         studio_id: studio_1.id
    #         })
    #
    #     movie_2 = Movie.create({
    #       title: "Another Comedy",
    #       creation_year: "2012",
    #       genre: "Comedy",
    #       studio_id: studio_1.id
    #       })
    #
    #   actor_1 = Actor.create({
    #       name: "Bob",
    #       age: 22
    #     })
    #
    #   actor_2 = Actor.create({
    #       name: "Alena",
    #       age: 20
    #     })
    #
    #   actor_3 = Actor.create({
    #       name: "Fred",
    #       age: 40
    #     })
    #   sorted_actors = Actor.sort_actors
    #   expect(sorted_actors).to eql(actor_2)
    #   expect(sorted_actors).to eql(actor_1)
    #   expect(sorted_actors).to eql(actor_3)
    # end
  end
end
