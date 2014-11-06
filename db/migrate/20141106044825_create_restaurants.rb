class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :website
      t.string :phone
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
