class Company < ActiveRecord::Base

  has_many :boards,
  primary_key: :id,
  foreign_key: :company_id,
  class_name: "Board"

  belongs_to :exchange,
  primary_key: :id,
  foreign_key: :exchange_id,
  class_name: "Exchange"
end
