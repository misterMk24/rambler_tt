class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :image, :tags

  # link :self do
  #   href "https://some_link.com/topic"
  # end
end
