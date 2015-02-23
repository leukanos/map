class CreateProjectsUsersTable < ActiveRecord::Migration
  def change
    create_table :projects_users do |t|
      t.references :user
      t.references :project
    end
    add_index :projects_users, [:user_id, :project_id]
    add_index :projects_users, [:project_id, :user_id]
  end
end
