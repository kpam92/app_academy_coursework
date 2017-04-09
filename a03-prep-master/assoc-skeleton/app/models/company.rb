class Company < ActiveRecord::Base

  has_many :boards,
  primary_key: :id,
  foreign_key: :company_id,
  class_name: "Board"
end
