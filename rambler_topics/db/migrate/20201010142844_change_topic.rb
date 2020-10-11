class ChangeTopic < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :tags, :string, array: true
    add_column :topics, :slug, :string, unique: true
    add_index :topics, :slug, unique: true
  end
end
