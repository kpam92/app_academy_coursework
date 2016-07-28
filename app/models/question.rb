class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: 'AnswerChoice'

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: 'Poll'

  has_many :responses,
  through: :answer_choices,
  source: :responses

  # def results
  #   answer_choices = self.answer_choices.includes(:responses)
  #   result = {}
  #   answer_choices.each do |choice|
  #     result[choice.answer] = choice.responses.length
  #   end
  #   result
  # end

  # def thing
  #   posts_with_counts = self
  # .select("answer_choices.*, COUNT(response.id)") # more in a sec
  # .group("posts.id") # "comments.post_id" would be equivalent
  # end
  def results
   # 1-query way w/ ActiveRecord
   # less efficient solutions are given above ^
   acs = self.answer_choices
     .select("answer_choices.answer, COUNT(responses.id) AS num_responses")
     .joins(".group(\"answer_choices.id\")LEFT OUTER JOIN responses ON responses.id = answer_choices.id")
    #  .joins(<<-SQL).group("answer_choices.id")
    #    LEFT OUTER JOIN responses
    #      ON answer_choices.id = responses.answer_id
    #  SQL

   acs.inject({}) do |results, ac|
     results[ac.answer] = ac.num_responses; results
   end
 end
end
