class TagTopic < ApplicationRecord
  validates :topic, presence: true

  has_many :tags,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

  has_many :links,
    through: :tags,
    source: :url

  def popular_links
    hash = {}
    links.each { |link| hash[link] = link.num_clicks }
    sorted = hash.sort_by {|_, clicks| clicks}.reverse
    sorted.each_with_index { |el, idx| puts "The link is #{el[0]}, and the clicks are #{el[1]}." if idx < 5}
    return nil
  end

end
