# frozen_string_literal

class CreateCharacteristics < ActiveRecord::Migration[6.0]
  def change
    create_table :characteristics do |t|
      t.references :vancancy
      t.boolean :air_conditioning
      t.boolean :exclusive_bathroom
      t.integer :parking_spot
      t.boolean :water_bill
      t.boolean :electricity_bill
      t.boolean :gas_bill
      t.integer :furnished
      t.string :furnished_description
      t.boolean :include_cleaner
      t.string :include_cleaner_description

      t.timestamps
    end
  end
end
