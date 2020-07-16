class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :type
      t.string :title
      t.string :description
      t.string :link
      t.string :date
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
