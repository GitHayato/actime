class CreateDistances < ActiveRecord::Migration[6.0]
  def change
    create_table :distances do |t|
      t.string     :distance, null: false
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
