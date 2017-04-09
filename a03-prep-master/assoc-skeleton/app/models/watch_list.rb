class WatchList < ActiveRecord::Base

  belongs_to :watcher,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "User"
end
