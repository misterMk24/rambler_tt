class TopicSerializer < ActiveModel::Serializer
  attributes :title, :preview, :image, :body, :link, :heading, :tags, :published_date
end
