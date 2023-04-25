CREATE TABLE Item (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

CREATE TABLE Music (
    id INT,
    name VARCHAR(100),
    on_spotify BOOLEAN,
    FOREIGN KEY (id) REFERENCES Item(id)
);

CREATE TABLE Genre (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
); 