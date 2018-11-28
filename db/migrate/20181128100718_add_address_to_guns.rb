class AddAddressToGuns < ActiveRecord::Migration[5.2]
  def change
    add_column :guns, :address, :string
  end
end
