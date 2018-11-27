class CreateBookingReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_reviews do |t|
      t.integer :rating
      t.text :content
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
