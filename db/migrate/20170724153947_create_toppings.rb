class CreateToppings < ActiveRecord::Migration[5.0]
  def change
    create_table :toppings do |t|
      t.string :name
      t.datetime :release_month
      t.integer :category
      t.integer :add_on_id
      t.boolean :homemade
      t.integer :course
    end
  end
end
