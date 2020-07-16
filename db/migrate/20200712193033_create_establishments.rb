class CreateEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :establishments do |t|
      t.string :name, null: false
      t.string :description
      t.integer :establishment_type, default: 0
      t.boolean :delivery_availability, default: true
      t.decimal :price, default: 0

      t.timestamps
    end
  end
end
