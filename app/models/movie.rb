class Movie < ApplicationRecord
validates_presence_of :title, :creation_year, :genre
  belongs_to :studio
end
