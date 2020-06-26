class CreateStudentResidence < ActiveRecord::Migration[6.0]
  def change
    create_table :student_residences do |t|
      t.string :name, null: false
      t.string :description
      t.integer :property_type, default: 0
      t.integer :accomodation_type, default: 0
      t.boolean :pet_friendly, default: true
      t.boolean :lgbt_friendly, default: true
      t.boolean :accept_smoker, default: false
      t.boolean :accept_alcoohol, default: true
      t.integer :residents_gender, default: 0
      t.integer :internet, default: 0
      t.integer :furniture, default: 0
      t.integer :capacity, null: false
      t.string :image

      t.timestamps
    end
  end
end
