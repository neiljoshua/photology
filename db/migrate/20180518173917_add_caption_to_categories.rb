class AddCaptionToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :caption, :string
  end
end
