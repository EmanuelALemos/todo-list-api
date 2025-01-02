class CreateColumns < ActiveRecord::Migration[8.0]
  def change
    create_table :columns do |t|
      t.string :title
      t.text :description
      t.string :color
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
