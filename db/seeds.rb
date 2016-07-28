# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create( user_name: "username1" )
User.create( user_name: "username2" )
User.create( user_name: "username3" )
User.create( user_name: "username4" )

Poll.create( title: "Poll1Title", author_id: 1 )
Poll.create( title: "Poll2Title", author_id: 2 )
Poll.create( title: "Poll3Title", author_id: 3 )
Poll.create( title: "Poll4Title", author_id: 4 )

Question.create( poll_id:1, text: "question1")
Question.create( poll_id:1, text: "question2")

Question.create( poll_id:2, text: "questionA")
Question.create( poll_id:2, text: "questionB")

Question.create( poll_id:3, text: "question2")
Question.create( poll_id:3, text: "question3")

Question.create( poll_id:4, text: "questionC")
Question.create( poll_id:4, text: "questionD")

AnswerChoice.create(answer: "A", question_id: 1)
AnswerChoice.create(answer: "B", question_id: 1)
AnswerChoice.create(answer: "C", question_id: 1)

AnswerChoice.create(answer: "A", question_id: 2)
AnswerChoice.create(answer: "B", question_id: 2)
AnswerChoice.create(answer: "C", question_id: 2)

AnswerChoice.create(answer: "A", question_id: 3)
AnswerChoice.create(answer: "B", question_id: 3)
AnswerChoice.create(answer: "C", question_id: 3)

AnswerChoice.create(answer: "A", question_id: 4)
AnswerChoice.create(answer: "B", question_id: 4)
AnswerChoice.create(answer: "C", question_id: 4)

AnswerChoice.create(answer: "A", question_id: 5)
AnswerChoice.create(answer: "B", question_id: 5)
AnswerChoice.create(answer: "C", question_id: 5)

AnswerChoice.create(answer: "A", question_id: 6)
AnswerChoice.create(answer: "B", question_id: 6)
AnswerChoice.create(answer: "C", question_id: 6)

AnswerChoice.create(answer: "A", question_id: 7)
AnswerChoice.create(answer: "B", question_id: 7)
AnswerChoice.create(answer: "C", question_id: 7)

AnswerChoice.create(answer: "A", question_id: 8)
AnswerChoice.create(answer: "B", question_id: 8)
AnswerChoice.create(answer: "C", question_id: 8)

Response.create(user_id: 1, answer_id: 1)
Response.create(user_id: 1, answer_id: 4)
Response.create(user_id: 1, answer_id: 7)
Response.create(user_id: 1, answer_id: 10)
Response.create(user_id: 1, answer_id: 13)
Response.create(user_id: 1, answer_id: 16)
Response.create(user_id: 1, answer_id: 19)
Response.create(user_id: 1, answer_id: 22)
Response.create(user_id: 2, answer_id: 2)
Response.create(user_id: 2, answer_id: 5)
Response.create(user_id: 2, answer_id: 8)
Response.create(user_id: 2, answer_id: 11)
Response.create(user_id: 2, answer_id: 14)
Response.create(user_id: 2, answer_id: 17)
Response.create(user_id: 2, answer_id: 20)
Response.create(user_id: 2, answer_id: 23)
