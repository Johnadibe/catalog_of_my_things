create table Author (
    id int generated always as identity,
    first_name char(30),
    last_name char(30),
    item_id int,
    foreign key (item_id) references Item(id)
)

create table Game (
    multiplayer boolean,
    last_played_at datetime,
)