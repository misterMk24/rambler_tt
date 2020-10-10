class ChangeTopic < ActiveRecord::Migration[6.0]
  enable_extension 'hstore' unless extension_enabled?('hstore')
  def change
    add_column :topics, :heading, :hstore
    add_column :topics, :tags, :string, array: true
  end
end
