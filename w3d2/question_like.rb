require_relative 'questions_database'

class QuestionLike

  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLike.new(datum) }
  end

  def initialize(options = {})
    @id = options['id']
    @user_id = options['user_id']
    @question_id  = options['question_id']
  end

  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
      SQL
      return nil unless question_like.length > 0
      QuestionLike.new(question_like.first)
  end

  def self.likers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_likes
        INNER JOIN
          users
          ON
          question_likes.user_id = users.id
      WHERE
        question_likes.question_id = ?
      SQL
    return nil unless users.length > 0
    users.map {|x| User.new(x)}
  end

  def self.num_likes_for_question_id(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) as num_likes
      FROM
        question_likes
      WHERE
        question_likes.question_id = ?
      GROUP BY
        question_id
      SQL
    return nil unless likes.length > 0
    likes[0]["num_likes"]
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_likes
        INNER JOIN
          questions
          ON
          question_likes.question_id = questions.id
      WHERE
        question_likes.user_id = ?
      SQL
    return nil unless questions.length > 0
    questions.map {|x| Question.new(x)}
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        COUNT(*) as num_likes, q.*
      FROM
        question_likes
        INNER JOIN
          questions q
          ON
          question_likes.question_id = q.id
      GROUP BY
        q.id
      ORDER BY
        COUNT(*)
      DESC
      LIMIT
        ?

      SQL
    return nil unless questions.length > 0
    questions.map {|x| Question.new(x)}
  end

  def create

  end

  def update
  end


end
