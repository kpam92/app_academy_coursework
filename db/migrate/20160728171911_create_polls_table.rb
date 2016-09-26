class CreatePollsTable < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title
      t.string :author
    end
  end
end
