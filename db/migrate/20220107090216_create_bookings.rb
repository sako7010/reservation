class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :start_day
      t.date :end_day
      t.integer :total_day
      t.integer :people
      t.string :total_amount

      t.timestamps
    end
  end
end
