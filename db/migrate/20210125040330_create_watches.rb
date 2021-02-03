class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.string        :watch,    null: false
      t.string        :event
      t.string        :distance
      t.references    :user,     foreign_key: true
      t.timestamps
    end
  end
end
