class CreateVacancy < ActiveRecord::Migration[6.0]
  def change
    create_table :vacancies do |t|
      t.references :student_residence
      t.integer :gender, default: 0
      t.string :description
      t.decimal :monthly_cost, default: 0
      t.integer :availability, default: 0
      t.string :availability_description
      t.integer :type, default: 0
      t.decimal :square_meter, default: 0

      t.timestamps
    end
  end
end
