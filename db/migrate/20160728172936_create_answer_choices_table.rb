class CreateAnswerChoicesTable < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.text :answer, null: false
      t.integer :question_id
    end
  end
end
