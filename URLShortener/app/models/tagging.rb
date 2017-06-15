class Tagging < ApplicationRecord
  validates :tag_id, :url_id, presence: true
  validates :tag_id, uniqueness: {scope: :url_id, message: "Url can only be tagged to the same tag once."}

  belongs_to :tag,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :TagTopic

  belongs_to :url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl
end
