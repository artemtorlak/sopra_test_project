class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :serial_id
      t.string :user_name
      t.integer :stars
      t.text :review_comment

      t.timestamps
    end
  end
end
