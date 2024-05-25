class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.string :role_type

      t.timestamps
    end

    add_index :user_roles, :role_type, unique: true
  end
end
