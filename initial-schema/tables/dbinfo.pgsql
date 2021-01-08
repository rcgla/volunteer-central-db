\c :dbname;
set schema 'rcglavc';
create table if not exists rcglavc."DbInfo" (
    "field" text primary key,
    "value" text not null
);
