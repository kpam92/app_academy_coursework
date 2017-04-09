class BoardMembership < ActiveRecord::Base

  belongs_to :board,
  primary_key: :id,
  foreign_key: :board_id

end
