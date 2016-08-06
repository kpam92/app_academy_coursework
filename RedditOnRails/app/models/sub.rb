class Sub < ActiveRecord::Base

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User

  has_many :posts

  has_many :post_subs, as: :postable

end
