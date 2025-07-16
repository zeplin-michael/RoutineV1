DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS exercises CASCADE;
DROP TABLE IF EXISTS routines CASCADE;
DROP TABLE IF EXISTS routine_exercises CASCADE;
DROP TABLE IF EXISTS user_exercise_logs CASCADE;

CREATE TABLE users (
  id serial PRIMARY KEY,
  username varchar(15) UNIQUE,
  email varchar,
  password_hash text NOT NULL,
  created_at timestamp default current_timestamp
);

CREATE TABLE exercises (
  id serial PRIMARY KEY,
  api_id varchar(100) UNIQUE,
  name varchar(100) NOT NULL,
  body_part varchar(50),
  equipment varchar(50),
  target_muscle varchar(50),
  gif_url text
);

CREATE TABLE routines (
  id serial PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name varchar(30) UNIQUE,
  description varchar(100),
  created_at date
);

CREATE TABLE routine_exercises (
  id serial PRIMARY KEY,
  routine_id integer NOT NULL REFERENCES routines(id) ON DELETE CASCADE,
  exercise_id integer NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
  order_index integer,
  sets integer,
  reps integer
);

CREATE TABLE user_exercise_logs (
  id serial PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  exercise_id integer NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
  performed_at timestamp,
  sets integer,
  reps integer,
  weight numeric
);