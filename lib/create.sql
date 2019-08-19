create table projects (
id INTEGER primary key
, title text 
, category text 
, funding_goal float
, start_date text
, end_date text);

create table users (
id INTEGER primary key
, name text
, age integer);

create table pledges (
id INTEGER primary key
, amount float
, user_id integer
, project_id integer);