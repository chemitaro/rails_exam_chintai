class CreateAccsesses < ActiveRecord::Migration[6.0]
  def change
    create_table :accsesses do |t|
      t.string :line_name
      t.string :station_name
      t.integer :distance
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
