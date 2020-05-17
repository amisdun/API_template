class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.string :title
      t.json :form
      t.integer :user_id
      t.integer :admin_id

      t.timestamps
    end
  end
end
