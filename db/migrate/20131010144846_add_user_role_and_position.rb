class AddUserRoleAndPosition < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, :default => false
    add_column :users, :is_crew, :boolean, :default => false
  end
end
