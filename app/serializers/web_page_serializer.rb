class WebPageSerializer < ActiveModel::Serializer
  attributes :id, :url
  has_many :content_records
end
