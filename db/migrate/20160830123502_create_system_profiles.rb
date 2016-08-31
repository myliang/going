class CreateSystemProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :system_profiles do |t|
      t.string :code
      t.string :name
      t.string :v
      t.timestamps
    end
  end
end
