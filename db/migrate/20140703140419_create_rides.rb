class CreateRides < ActiveRecord::Migration[4.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :tickets
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :min_height
    end
  end
end
