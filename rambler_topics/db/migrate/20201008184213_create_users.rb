class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :email, null: false
      t.boolean :admin, default: false
    end

    add_column :topics, :author_id, :bigint
    add_foreign_key :topics, :users, column: :author_id, primary_key: "id"
  end
end
