class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :poll_id, null: false
      t.string :text
    end
  end
end
