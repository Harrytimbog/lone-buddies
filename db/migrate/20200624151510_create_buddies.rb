class CreateBuddies < ActiveRecord::Migration[6.0]
  def change
    create_table :buddies do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :category
      t.string :photo
      t.string :address
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
