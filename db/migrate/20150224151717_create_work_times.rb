class CreateWorkTimes < ActiveRecord::Migration
  def change
    create_table :work_times do |t|
      t.references  :user
      t.references  :project
      t.integer     :form_id
      t.integer     :action_id
      t.date        :date
      t.decimal     :time
      t.string      :comment

      t.timestamps null: false
    end
  end
end
