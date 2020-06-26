# frozen_string_literal

class CreateCharacteristics < ActiveRecord::Migration[6.0]
  def change
    create_table :characteristics do |t|
      t.references :vacancy, foreign_key: true, index: true, null: false
      t.boolean :air_conditioning, default: false
      t.boolean :exclusive_bathroom, default: true
      t.integer :parking_spot, default: 0
      t.boolean :water_bill, default: true
      t.boolean :electricity_bill, default: true
      t.boolean :gas_bill, default: true
      t.integer :furnished, default: 0
      t.string :furnished_description
      t.boolean :include_cleaner, default: false
      t.string :include_cleaner_description, null: false

      t.timestamps
    end
  end
end
