require_relative 'questions_database'
require_relative 'model_base'

class Reply < ModelBase

  attr_accessor :parent_id, :user_id, :question_id, :body

  def self.all
    super('replies')
  end

  def initialize(options = {})
    @id = options['id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @question_id  = options['question_id']
    @body = options['body']

  end

  def self.find_by_id(id)
    super(id, "replies")
  end

  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
      SQL
      return nil unless reply.length > 0
      reply.map {|x| Reply.new(x) }
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
      SQL
      return nil unless reply.length > 0
      reply.map {|x| Reply.new(x)}
  end

  def author
    User.find_by_user_id(@user_id)
  end

  def question
    Question.find_by_question_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_id)
  end

  def child_replies
    reply = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
      SQL
      return nil unless reply.length > 0
      reply.map {|x| Reply.new(x)}
  end

  def save
    if @id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, @body, @user_id, @question_id, @parent_id)
        INSERT INTO
          replies (body, user_id, question_id, parent_id)
        VALUES
          (?, ?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, @body, @user_id, @question_id, @parent_id, @id)
      UPDATE
        replies
      SET
        body = ?, user_id = ?, question_id = ?, parent_id = ?
      WHERE
        id = ?
    SQL
    end

  end

end
