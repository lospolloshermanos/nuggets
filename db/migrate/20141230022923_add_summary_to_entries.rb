class AddSummaryToEntries < ActiveRecord::Migration
  def up
  	add_column :entries, :summary, :text
  end
end
