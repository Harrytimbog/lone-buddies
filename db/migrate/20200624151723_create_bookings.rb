class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :price
      t.datetime :start_on
      t.datetime :end_on
      t.references :user, null: false, foreign_key: true
      t.references :buddy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
