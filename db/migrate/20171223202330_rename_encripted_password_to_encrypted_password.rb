class RenameEncriptedPasswordToEncryptedPassword < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :encripted_password, :encrypted_password
  end
end
