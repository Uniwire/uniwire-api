class CreateCommoditiesVacancies < ActiveRecord::Migration[6.0]
  def change
    create_table :commodities_vacancies do |t|
      t.belongs_to :vacancy, index: true, foreign_key: true, null: false
      t.belongs_to :commodity, index: true, foreign_key: true, null: false
    end
  end
end
