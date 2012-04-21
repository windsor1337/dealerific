class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :dealer_id
      t.string :reference_code
      t.string :title
      t.string :make
      t.string :model
      t.string :year
      t.string :color
      t.string :transmission
      t.string :miles
      t.string :list_price
      t.date :list_date
      t.string :description

      t.timestamps
    end
  end
end
