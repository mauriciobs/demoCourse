class CreateUserRoleTable < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :role

      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :email
      t.references :role, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}

      t.timestamps
    end
  end
end
