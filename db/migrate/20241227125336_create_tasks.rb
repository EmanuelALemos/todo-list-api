class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.integer :priority
      t.references :column, null: false, foreign_key: true

      t.timestamps
    end
  end
end
