require_relative 'questions_database'
require_relative 'question'
require_relative 'reply'
require_relative 'model_base'
class User < ModelBase

  attr_accessor :fname, :lname

  def self.all
    super('users')
  end

  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    super(id,"users")
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
      SQL
      return nil unless user.length > 0
      User.new(user.first)
  end

  def authored_questions
    Question.find_by_user_id(@author_id)
  end

  def authored_replies
    Reply.find_by_user_id(@author_id)
  end

  def followed_questions
    QuestionFollow.followed_questions_by_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    avg_karma = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        (CAST(COUNT(question_likes.question_id) AS FLOAT) /
          COUNT(DISTINCT(questions.id))) AS avg
      FROM
        questions
      LEFT OUTER JOIN
        question_likes
      ON
        questions.id = question_likes.question_id
      WHERE
        questions.author_id = ?
    SQL
    return nil unless avg_karma.length > 0
    avg_karma.first["avg"]
  end

  def save
    if @id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO
          users (fname, lname)
        VALUES
          (?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
    end
  end



end
