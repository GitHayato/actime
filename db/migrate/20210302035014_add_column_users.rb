class AddColumnUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :public_uid, :string, null: false
  end
end
