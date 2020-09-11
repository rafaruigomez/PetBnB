class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description

      t.references :flat

      t.timestamps
    end
  end
end
