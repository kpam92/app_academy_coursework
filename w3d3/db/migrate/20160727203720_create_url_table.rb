class CreateUrlTable < ActiveRecord::Migration
  def change
    create_table :url_tables do |t|
      t.string :long_url, null: false
      t.string :short_url
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
