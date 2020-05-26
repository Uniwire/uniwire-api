class CreateStudentResidence < ActiveRecord::Migration[6.0]
  def change
    create_table :student_residences do |t|
      t.string :name, null: false
      t.string :description
      t.integer :property_type
      t.integer :accomodation_type
      t.boolean :pet_friendly
      t.boolean :lgbt_friendly
      t.boolean :accept_smoker
      t.boolean :accept_alcoohol
      t.integer :residents_gender
      t.integer :internet
      t.integer :furniture
      t.integer :capacity, null: false

      t.timestamps
    end
  end
end
