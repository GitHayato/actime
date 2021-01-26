class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.string     :watch,    null: false
      t.string     :event,    null: false  
      t.string     :distance, null: false
      t.references :user,     foreign_key: true, null: false
      t.timestamps
    end
  end
end
