class CreateGuns < ActiveRecord::Migration[5.2]
  def change
    create_table :guns do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :year_of_production
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
