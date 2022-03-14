class CreateEncryption < ActiveRecord::Migration[5.2]
  def change
    create_table :encryptions do |t|
      t.string :ciphertext
      t.string :key

      t.timestamps
    end
  end
end
