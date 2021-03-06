class CreateAvengers < ActiveRecord::Migration[6.0]
  def change
    create_table :avengers do |t|
      t.string :name
      t.text :description
      t.string :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
