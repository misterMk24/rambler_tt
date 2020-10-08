class User < ApplicationRecord
  extend Devise::Models
  has_many :authored_topics, class_name: "Topic", foreign_key: 'author_id'
  validates :username, presence: true, 
                       uniqueness: true
  validates :email, presence: true

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
