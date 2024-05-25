class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :status
      t.date :start_date
      t.date :end_date
      t.bigint :user_id

      t.timestamps
    end

    # add_foreign_key :projects, "public.users", column: :user_id, on_delete: :cascade
    add_index :projects, :user_id
  end
end
