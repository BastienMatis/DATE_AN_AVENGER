class AddCoordinatesToAvengers < ActiveRecord::Migration[6.0]
  def change
    add_column :avengers, :latitude, :float
    add_column :avengers, :longitude, :float
  end
end
