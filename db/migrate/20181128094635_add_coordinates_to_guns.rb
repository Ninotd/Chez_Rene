class AddCoordinatesToGuns < ActiveRecord::Migration[5.2]
  def change
    add_column :guns, :latitude, :float
    add_column :guns, :longitude, :float
  end
end
