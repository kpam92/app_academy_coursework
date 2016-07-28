class ChangeUrLnames < ActiveRecord::Migration
  def change
    rename_table :url_tables, :shortened_urls
  end
end
