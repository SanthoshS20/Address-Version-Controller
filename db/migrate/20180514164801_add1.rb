class Add1 < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :address_id, :integer
    add_column :versions, :address, :string
  end
end
