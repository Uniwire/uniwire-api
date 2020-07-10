class CreateRiskAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :risk_areas do |t|
      t.integer :type
      t.string :description

      t.timestamps
    end
  end
end
