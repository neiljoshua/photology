class CreateUsers < ActiveRecord::Migration[5.1]
<<<<<<< HEAD
=======
	has_attached_file :image, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
>>>>>>> b53b7d9534e8315f3b0bca521a11e833b7b7b599
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
