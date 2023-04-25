create table Author (
    id int generated always as identity,
    first_name char(30),
    last_name char(30),
    item_id int,
    foreign key (item_id) references Item(id)
)

create table Game (
    id int,
    last_played_at datetime,
    multiplayer boolean,
    foreign key (id) references Item(id)
)