class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :ease, null: false, default: 1
      t.integer :taste, null: false, default: 1
      t.integer :purpose, null: false, default: 2
      t.text :addition

      t.timestamps
    end
  end
end
