class AddMessageToDecryptions < ActiveRecord::Migration[5.2]
  def change
    add_column :decryptions, :message, :string
  end
end
