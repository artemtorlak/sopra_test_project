class CreateActorsSerials < ActiveRecord::Migration[7.0]
  def change
    create_table :actors_serials do |t|
      t.integer :actor_id
      t.integer :serial_id

      t.timestamps
    end
  end
end
