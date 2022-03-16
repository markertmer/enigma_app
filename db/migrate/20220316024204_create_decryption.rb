class CreateDecryption < ActiveRecord::Migration[5.2]
  def change
    create_table :decryptions do |t|
      t.string :text
      t.string :key
      t.string :date
    end
  end
end
