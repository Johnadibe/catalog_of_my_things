CREATE TABLE Items (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

create table Authors (
    id int generated always as identity,
    first_name char(30),
    last_name char(30),
    item_id int,
    foreign key (item_id) references Item(id)
)

create table Games (
    id int,
    last_played_at datetime,
    multiplayer boolean,
    foreign key (id) references Item(id)
)

CREATE TABLE Music (
    id INT,
    name VARCHAR(100),
    on_spotify BOOLEAN,
    FOREIGN KEY (id) REFERENCES Item(id)
);

CREATE TABLE Genres (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(50),
  cover_state VARCHAR(50),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  label_id INT REFERENCES labels(id)
   genre_id INTEGER REFERENCES genres(id),
  author_id INTEGER REFERENCES authors(id),
);

CREATE TABLE Labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(250),
  color VARCHAR(50)
);
