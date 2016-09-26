class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :user_id, presence: true
  validates :short_url, :long_url, uniqueness: true

  belongs_to :submitter, {
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
  }

  has_many(
    :visitors,
    Proc.new { distinct }, #<<<
    through: :visits,
    source: :visitor
  )

  has_many :visits, {
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: "Visit"
  }

  def self.random_code
    new_short_url = SecureRandom.base64(16)
    while ShortenedUrl.exists?(:short_url => new_short_url)
      new_short_url = SecureRandom.base64(16)
    end
    return new_short_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
  end

  def num_clicks
    self.visits.length
  end

   def num_uniques
#   self.visitors.select(:id, :created_at).distinct
    self.visitors.length
  end

  def num_recent_uniques
    self.visits.select(:user_id).distinct.where(created_at: 10.minutes.ago..Time.now).length
  end



end
