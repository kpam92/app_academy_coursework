class Board < ActiveRecord::Base

  has_many :board_memberships,
  primary_key: :id,
  foreign_key: :board_id

  belongs_to :company,
  primary_key: :id,
  foreign_key: :company_id
end
