class AddMessageToEncryptions < ActiveRecord::Migration[5.2]
  def change
    add_column :encryptions, :message, :string
  end
end
