require_relative 'questions_database'
require_relative 'question'
require_relative 'user'

class QuestionFollow

  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def initialize(options = {})
    @id = options['id']
    @user_id = options['user_id']
    @question_id  = options['question_id']
  end

  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
      SQL
    return nil unless question_follow.length > 0
    QuestionFollow.new(question_follow.first)
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
        INNER JOIN
          users
          ON
          question_follows.user_id = users.id
      WHERE
        question_follows.question_id = ?
      SQL
    return nil unless followers.length > 0
    followers.map {|x| User.new(x)}
  end

  def self.followed_questions_by_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
        INNER JOIN
          questions
          ON
          question_follows.user_id = questions.author_id
      WHERE
        question_follows.user_id = ?
      SQL
    return nil unless questions.length > 0
    questions.map {|x| Question.new(x)}
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        COUNT(*) as num_follows, q.id, q.body, q.title, q.author_id
      FROM
        question_follows
        INNER JOIN
          questions q
          ON
          question_follows.question_id = q.id
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
