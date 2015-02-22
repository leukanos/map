class UpdateUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :tel, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :roles_mask, :integer
    add_column :users, :limit, :decimal, :precision => 8, :scale => 2

  end
end
