class AddColumnToRooms < ActiveRecord::Migration[6.0]
  def up
    add_column :rooms, :public_uid, :string, null: false
  end
end
