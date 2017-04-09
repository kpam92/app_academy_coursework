class User < ActiveRecord::Base
  has_many :watch_lists,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "WatchList"
end
