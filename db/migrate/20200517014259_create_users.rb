class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :organization_name
      t.integer :organization_id

      t.timestamps
    end
  end
end
