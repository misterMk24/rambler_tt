class User < ApplicationRecord
  has_many :authored_topics, class_name: "Topic", foreign_key: 'author_id'
  validates :username, presence: true, 
                       uniqueness: true
  validates :email, presence: true
end
