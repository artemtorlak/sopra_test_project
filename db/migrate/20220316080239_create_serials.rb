class CreateSerials < ActiveRecord::Migration[7.0]
  def change
    create_table :serials do |t|
      t.string :name
      t.string :genre
      t.integer :number_of_seasons
      t.date :date_of_first_release
      t.string :director
      t.string :country

      t.timestamps
    end
  end
end
