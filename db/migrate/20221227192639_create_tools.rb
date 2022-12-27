class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.integer :code, null: false
      t.string :name, null: false
      t.string :brand, null: false
      t.integer :kind, null: false, default: 0
      t.text :observations
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
