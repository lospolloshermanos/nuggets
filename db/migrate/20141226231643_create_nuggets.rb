class CreateNuggets < ActiveRecord::Migration
  def change
    create_table :nuggets do |t|
      t.string :name
      t.string :rss
      t.references :user

      t.timestamps null: false
    end

    add_index :nuggets, :user_id
    add_index :nuggets, :name
    add_index :nuggets, :rss, unique: true
  end
end
