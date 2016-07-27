require_relative 'questions_database'
require_relative 'model_base'
class Question < ModelBase

  attr_accessor :body, :title, :author_id

  def self.all
    super('questions')
  end

  def initialize(options = {})
    @id = options['id']
    @body = options['body']
    @title = options['title']
    @author_id = options['author_id']
  end

  def self.find_by_id(id)
    super(id,'questions')
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
      SQL
    return nil unless question.length > 0

    question.map {|x| Question.new(x)}
  end

  def author
    User.find_by_user_id(@author_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def save
    super('questions',@body,@title, @author_id)
  end


end
