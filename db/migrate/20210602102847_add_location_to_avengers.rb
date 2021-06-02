class AddLocationToAvengers < ActiveRecord::Migration[6.0]
  def change
    add_column :avengers, :location, :string
  end
end
