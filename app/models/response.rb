class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true
  validate :respondent_already_answered?, :author_responding?

  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_id,
  class_name: 'AnswerChoice'

  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: 'User'

  has_one :question,
  through: :answer_choice,
  source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    if self.sibling_responses.exists?(user_id: self.user_id)
      errors[:answered] << "respondent already answered this question"
    end
  end

  def author_responding?
    if self.user_id == self.question.poll.author_id
      errors[:answered] << "Author can't vote in own poll!"
    end
  end
end
