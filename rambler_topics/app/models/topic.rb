class Topic < ApplicationRecord
  before_validation :set_slug_and_link
  belongs_to :author, class_name: "User", foreign_key: 'author_id'
  validates :title, :preview, :image, :body, presence: true
  validates :slug, uniqueness: true

  scope :filter_by_asc, ->(main_attr) { order(main_attr => :asc) }
  scope :filter_by_desc, ->(main_attr) { order(main_attr => :desc) }
  scope :filter_by_heading, ->(heading) { where(slug: heading[:slug], title: heading[:title]) }
  scope :filter_by_ids, ->(ids) { where(id: ids.split(',')) }
  scope :filter_by_tag, ->(tags) { where(tags: tags.split(',')) }

  private

  def set_slug_and_link
    self.slug = self.title.parameterize(separator: "/")
    self.link = "/#{slug}/#{self.preview.parameterize(separator: "-")}.html"
  end

  def heading
    { "slug": self.slug, "title": self.title }
  end

  def published_date
    self.created_at.to_s
  end
end
