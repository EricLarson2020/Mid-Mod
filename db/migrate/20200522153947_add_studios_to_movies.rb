class AddStudiosToMovies < ActiveRecord::Migration[5.1]
  def change
    add_reference :movies, :studios, foreign_key: true
  end
end
