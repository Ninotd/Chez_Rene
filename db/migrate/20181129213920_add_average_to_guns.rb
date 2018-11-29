class AddAverageToGuns < ActiveRecord::Migration[5.2]
  def change
    add_column :guns, :average, :float

  end
end
