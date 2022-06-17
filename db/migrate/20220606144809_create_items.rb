class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.decimal :kcal, precision:6, scale:2, null: false
      t.decimal :protein, precision:6, scale:2, null: false
      t.decimal :fat, precision:6, scale:2, null: false
      t.decimal :carbohydrate, precision:6, scale:2, null: false
      t.string :brand, null: false
      t.string :flavor, null: false
      t.integer :volume, null: false
      t.string :protein_type, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
