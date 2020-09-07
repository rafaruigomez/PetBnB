class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :reservation_start
      t.date :reservation_end
      t.string :status

      t.timestamps
    end
  end
end
