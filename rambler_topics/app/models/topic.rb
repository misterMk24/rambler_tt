class Topic < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: 'author_id'
  validates :title, :image, :body, :link, presence: true
end
