class Actor < ApplicationRecord
validates_presence_of :name, :age
  has_many :movie_actors
  has_many :movies, through: :movie_actors


  def self.average_age
    
    Actor.average(:age).round(1)
  end
end
