class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :state
      t.string :note
      t.text :rule
      t.integer :users_count, default: 0
      t.timestamps
    end
  end
end
