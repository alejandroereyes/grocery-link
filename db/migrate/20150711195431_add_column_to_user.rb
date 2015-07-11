class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :system_admin, :boolean, :default => false
  end
end
