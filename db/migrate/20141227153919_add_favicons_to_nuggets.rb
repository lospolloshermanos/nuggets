class AddFaviconsToNuggets < ActiveRecord::Migration
  def change
  	add_column :nuggets, :favicon, :string
  end
end
