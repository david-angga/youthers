class AddDescriptionToUser < ActiveRecord::Migration
  def change
    add_column :users, :position, :string
    add_column :users, :description, :string
    add_column :users, :facebook_acc, :string
    add_column :users, :twitter_acc, :string
  end
end
