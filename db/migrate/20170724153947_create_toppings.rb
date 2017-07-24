class CreateToppings < ActiveRecord::Migration[5.0]
  def change
    create_table :toppings do |t|
      t.string :name
      t.datetime :release_month
      t.integer :category
      t.boolean :homemade
      t.integer :course
      t.references :add_on, foreign_key: true
    end
  end
end
