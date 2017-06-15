

class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true
  validate :no_spamming
  def self.random_code
    random_url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: random_url )
      random_url = SecureRandom.urlsafe_base64
    end
      random_url
  end

  def self.new_shortened_url(user,long_url)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.create!(long_url: long_url,short_url: short_url,user_id: user.id)
  end

  def num_clicks
    visits.length
  end

  def num_uniques
    visitors.select(:id).distinct.length
  end

  def num_recent_uniques
    users = []
    visits.select{|block| block[:created_at] > 10.minutes.ago}.each do |hash|
      users << hash[:user_id] unless users.include?(hash[:user_id])
    end
    users.length
  end

  def no_spamming
    all_urls = ShortenedUrl.all
    hash = {}
    all_urls.each{|link| hash[link] = link.created_at}
    hash = hash.sort_by{|_, time| time}.reverse
    if hash[4]
      if hash[4][1] > 1.minutes.ago
        self.errors.add(:created_at," can't spam")
      end
    end
  end

  def nonpremium_max
    user = User.find_by(id: self.user_id)
    user_urls = user.submitted_urls
    if user.premium == 0 && user_urls.length == 1
      self.errors.add(:user_id, " is not premium and has submitted too many urls.")
    end
  end
  # has_many :num_uniques,
  #   Proc.new{distinct},
  #   through: :visits,
  #   source: :user
  has_many :tags,
    through: :taggings,
    source: :tag

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tagging

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :user

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
