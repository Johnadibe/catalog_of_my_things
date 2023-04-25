CREATE TABLE items (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE authors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE games (
    id INT PRIMARY KEY,
    last_played_at TIMESTAMP,
    multiplayer BOOLEAN,
    FOREIGN KEY (id) REFERENCES items(id)
);

CREATE TABLE music (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    on_spotify BOOLEAN,
    FOREIGN KEY (id) REFERENCES items(id)
);

CREATE TABLE genres (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publisher VARCHAR(50) NOT NULL,
    cover_state VARCHAR(50) NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    label_id INT REFERENCES labels(id),
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id)
);

CREATE TABLE labels (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    color VARCHAR(50) NOT NULL
);
