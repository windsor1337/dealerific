class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :car_id
      t.string :description
      t.boolean :primary

      t.timestamps
    end
  end
end
