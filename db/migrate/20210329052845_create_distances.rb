class CreateDistances < ActiveRecord::Migration[6.0]
  def change
    create_table :distances do |t|

      t.timestamps
    end
  end
end
