create table Author (
    id int generated always as identity,
    first_name char(30),
    last_name char(30),
    item_id int,
    foreign key (item_id) references Item(id)
)

create table Game (
    id int generated always as identity,
    genre char(30),
    author char(30), 
    source char(30),
    label char(30),
    publish_date datetime,
    last_played_at datetime,
    multiplayer boolean,
    archived boolean
)