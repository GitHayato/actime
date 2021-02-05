class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string     :thread_name, null: false
      t.timestamps
    end
  end
end
