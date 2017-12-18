class AddPaperclipToImages < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :users, :image
  end

  def up
    add_attachment :users, :image
  end

  def down
    remove_attachment :users, :image
  end
end
