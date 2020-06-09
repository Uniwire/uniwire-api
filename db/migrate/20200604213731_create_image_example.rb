class CreateImageExample < ActiveRecord::Migration[6.0]
  def change
    create_table :image_examples do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
