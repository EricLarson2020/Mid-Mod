class Movie < ApplicationRecord
validates_presence_of :title, :creation_year, :genre 

end
