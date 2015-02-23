class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :name
      t.string  :short_name, limit: 25
      t.string  :state
      t.date    :closing_date
      t.string  :ancestry
      t.references :assigned_to

      t.timestamps null: false
    end
  end
end
