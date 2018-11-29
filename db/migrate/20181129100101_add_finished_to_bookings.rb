class AddFinishedToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :finished, :boolean
  end
end
