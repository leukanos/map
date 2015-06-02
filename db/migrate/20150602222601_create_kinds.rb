class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
