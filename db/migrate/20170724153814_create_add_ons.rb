class CreateAddOns < ActiveRecord::Migration[5.0]
  def change
    create_table :add_ons do |t|
      t.string :name
      t.string :brand
    end
  end
end
