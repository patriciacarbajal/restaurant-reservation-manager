class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.time :open_time
      t.time :closing_time
      t.string :phone
      t.string :address
    end
  end
end
