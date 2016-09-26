class ModelBase
  def initialize
  end

  def self.find_by_id(id,table)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
      SQL
      return nil unless user.length > 0
      self.new(user.first)
  end

  def self.all(table)
    data = QuestionsDatabase.instance.execute("SELECT * FROM #{table}")
    data.map { |datum| self.new(datum) }
  end

  #instance_variables[2].to_s[1..-1]

  def save(table,*args)
    ivs = self.instance_variables
    ivs2 = ivs.map {|x| x.to_s[1..-1]}[1..-1].join(", ")
    ivs3 = ivs.map {|x| x.to_s[1..-1]+ " = ?"}[1..-1].join(", ")
    if @id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, *args)
        INSERT INTO
          #{table} (#{ivs2})
        VALUES
          (#{("?," * (ivs.count-1)).chop})
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, *args, @id)
      UPDATE
        #{table}
      SET
        #{ivs3}
      WHERE
        id = ?
    SQL
    end
  end
end
