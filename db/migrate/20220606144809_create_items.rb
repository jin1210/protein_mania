class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.integer :kcal, null: false
      t.integer :protein, null: false
      t.integer :fat, null: false
      t.integer :carbohydrate, null: false
      t.string :brand, null: false
      t.string :flavor, null: false
      t.integer :volume, null: false
      t.string :type, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
