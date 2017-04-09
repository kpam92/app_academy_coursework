class Board < ActiveRecord::Base

  has_many :memberships,
  primary_key: :id,
  foreign_key: :board_id,
  class_name: "BoardMembership"

  belongs_to :company,
  primary_key: :id,
  foreign_key: :company_id,
  class_name: "Company"
end
