create table Author (
    id int generated always as identity,
    first_name char(30),
    last_name char(30),
    item_id int,
    foreign key (item_id) references Item(id)
)

create table Game (
    id int generated always as identity,
    genre_id int,
    author_id int, 
    source_id int,
    label_id int,
    publish_date datetime,
    last_played_at datetime,
    multiplayer boolean,
    archived boolean,
    foreign key (author_id) references Author(id),
    foreign key (label_id) references Label(id),
    foreign key (author_id) references Author(id),
    foreign key (author_id) references Genre(id),
)