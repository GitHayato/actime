class AddColumnIntroductionToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :introduction, :text
  end
end
