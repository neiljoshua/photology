class CreateImages < ActiveRecord::Migration[5.1]
	belongs_to :user
	has_attached_file :image
  def change
    create_table :images do |t|
      t.string :title
      t.string :location
      t.text :description
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
