class AddMessageToCracks < ActiveRecord::Migration[5.2]
  def change
    add_column :cracks, :message, :string
  end
end
