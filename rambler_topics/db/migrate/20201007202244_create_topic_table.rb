class CreateTopicTable < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.string :preview
      t.string :image, null: false
      t.string :body, null: false
      t.string :link, null: false
      
      t.timestamps
    end
  end
end
