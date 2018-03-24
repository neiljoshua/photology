class ChangeStatusToBeStrinInCategories < ActiveRecord::Migration[5.1]
  def change
  	change_column :categories, :status, :integer
  end
end
