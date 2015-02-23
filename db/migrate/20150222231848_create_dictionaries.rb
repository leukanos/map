class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.integer  :kind
      t.string  :symbol
      t.string  :ancestry

      t.timestamps null: false
    end

    add_index :dictionaries, :kind
    add_index :dictionaries, :ancestry
  end
end
