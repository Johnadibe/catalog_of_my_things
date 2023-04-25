CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(50),
  cover_state VARCHAR(50),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  label_id INT REFERENCES labels(id)
   genre_id INTEGER REFERENCES genres(id),
  author_id INTEGER REFERENCES authors(id),
);

CREATE TABLE labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(250),
  color VARCHAR(50)
);
