class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :cmpy_id
      t.text :address
    end
  end
end
