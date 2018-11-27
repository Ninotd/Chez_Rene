class AddPhotoToGuns < ActiveRecord::Migration[5.2]
  def change
    add_column :guns, :photo, :string
  end
end
