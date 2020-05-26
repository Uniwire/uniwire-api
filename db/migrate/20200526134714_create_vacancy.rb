class CreateVacancy < ActiveRecord::Migration[6.0]
  def change
    create_table :vacancies do |t|
      t.references :student_residence
      t.integer :gender
      t.string :description
      t.decimal :monthly_cost
      t.integer :availability
      t.string :availability_description
      t.integer :type
      t.decimal :square_meter

      t.timestamps
    end
  end
end
