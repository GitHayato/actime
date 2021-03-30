class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string     :event, null: false
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
