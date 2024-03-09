DROP TABLE users;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(80),
  last_name VARCHAR(80),
  nickname VARCHAR(80),
  email VARCHAR(160) NOT NULL UNIQUE,
  password VARCHAR(16) NOT NULL,
  birthday DATE NOT NULL CHECK (birthday > '1930-01-01' AND birthday <= current_date )
);

CREATE TABLE videos(
  id SERIAL PRIMARY KEY,
  title VARCHAR(300),
  description TEXT,
  upload_date DATE,
  reactions_count SERIAL,
  owner_id INT NOT NULL REFERENCES users(id)
);

-- reaction_type VARCHAR(10)?
CREATE TABLE reactions(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id),
  video_id INT NOT NULL REFERENCES videos(id),
  reaction_type VARCHAR(10)
);

-- access_type TEXT ?
CREATE TABLE playlists(
  id SERIAL PRIMARY KEY,
  author_id INT NOT NULL REFERENCES users(id),
  access_type TEXT,
  description TEXT
);

CREATE TABLE playlists_video(
  playlist_id INT NOT NULL REFERENCES playlists(id),
  video_id INT NOT NULL REFERENCES videos(id)
);

-- reactions_count SERIAL?
CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id),
  video_id INT NOT NULL REFERENCES videos(id),
  text VARCHAR(600),
  reactions_count SERIAL
);



