class Topic < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: 'author_id'
  validates :title, :image, :body, :link, presence: true

  scope :filter_by_asc, ->(main_attr) { order(main_attr => :asc) }
  scope :filter_by_desc, ->(main_attr) { order(main_attr => :desc) }
  scope :filter_by_heading, ->(heading) { where(heading: {"slug" => heading[:slug], "title" => heading[:title]}) }
  scope :filter_by_ids, ->(ids) { where(id: ids.split(',')) }
  scope :filter_by_tag, ->(tags) { where(tags: tags.split(',')) }
end
