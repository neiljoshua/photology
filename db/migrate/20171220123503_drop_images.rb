class DropImages < ActiveRecord::Migration[5.1]
  def up
  	drop_table :images
  end
end
