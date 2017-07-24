class CreateIceCreams < ActiveRecord::Migration[5.0]
  def change
    create_table :ice_creams do |t|
      t.string :name
      t.datetime :release_start
      t.datetime :release_end
      t.text :categories
      t.integer :servings
      t.integer :course
    end
  end
end
