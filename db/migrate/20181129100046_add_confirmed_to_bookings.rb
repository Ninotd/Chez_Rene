class AddConfirmedToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :confirmed, :string, :default => "En attente"
  end
end
