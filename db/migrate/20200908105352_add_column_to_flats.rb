class AddColumnToFlats < ActiveRecord::Migration[6.0]
  def change
    change_column :flats, :address, :text
  end
end
