DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  author_id NOT NULL,

  FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES question(id),
  FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT,

  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(parent_id) REFERENCES replies(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)

);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES question(id),
  FOREIGN KEY(user_id) REFERENCES user(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ("Kevin", "Mathews"),
  ("Denver", "Chen"),
  ("a", "b"),
  ("c", "d"),
  ("e", "f"),
  ("g", "h");

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('h','a',(SELECT id FROM users WHERE fname = 'Kevin')),
  ('i','b',(SELECT id FROM users WHERE fname = 'Denver')),
  ('d','e',(SELECT id FROM users WHERE fname = 'Denver')),
  ('j','c',(SELECT id FROM users WHERE fname = 'a')),
  ('d','e',(SELECT id FROM users WHERE fname = 'Denver')),
  ('d','e',(SELECT id FROM users WHERE fname = 'a'));
INSERT INTO
  question_follows (question_id, user_id)
VALUES
  (2,1),
  (2,2),
  (2,3),
  (1,4),
  (2,5),
  (3,2),
  (3,4);

INSERT INTO
  replies (question_id, parent_id, user_id, body)
VALUES
  (1,NULL,1,"hi"),
  (1,1,2,"bye");

INSERT INTO
  question_likes(question_id, user_id)
VALUES
  (2,1),
  (2,2),
  (2,3),
  (1,4),
  (2,5),
  (3,2),
  (4,1),
  (4,2),
  (4,3),
  (4,4);
