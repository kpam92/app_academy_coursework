
class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls, {
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "ShortenedUrl"
  }

  has_many(
    :visited_urls,
    Proc.new { distinct },
    through: :visits,
    source: :shortened_url
  )

  # has_many(
  #   :visitors,
  #   Proc.new { distinct }, #<<<
  #   through: :visits,
  #   source: :visitor
  # )

  has_many :visits, {
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Visit"
  }


end
