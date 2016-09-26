class Post < ActiveRecord::Base
  validates :title, :content, :author_id, :sub_id, presence: true

  belongs_to :sub

  has_many :post_subs, as: :postable

end
