class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.integer :story_point
      t.date :start_date
      t.date :end_date
      t.references :project, null: false, foreign_key: true
      t.integer :assigned_to_id

      t.timestamps
    end
  end
end
