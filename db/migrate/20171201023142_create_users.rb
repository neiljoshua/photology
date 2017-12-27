class CreateUsers < ActiveRecord::Migration[5.1]

	has_attached_file :image, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :usermane
      t.string :password

      t.timestamps
    end
  end
end
