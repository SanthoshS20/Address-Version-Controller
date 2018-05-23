class CreateVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :versions do |t|
      t.integer 
      t.timestamps
    end
  end
end
