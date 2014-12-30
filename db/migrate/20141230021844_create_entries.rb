class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :url
      t.text :content
      t.string :author
      t.boolean :favourite, default: false
      t.string :categories
      t.references :nugget
      t.datetime :published_at

      t.timestamps null: false
    end

    add_index :entries, :url
    add_index :entries, :author
    add_index :entries, :nugget_id
  end
end
