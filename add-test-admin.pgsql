\c :dbname;
-- this is a function because otherwise we can't use RETURNING ... INTO ... 
do $$ 
declare
    new_id integer;
begin 

INSERT into rcglavc."Logins"(
    "username",
    "password"
)
VALUES (
    'mayor',
    crypt('dancingpaint', gen_salt('bf'))
)
RETURNING "id" INTO new_id;

INSERT INTO rcglavc."Users"(
    "login_id",
    "name",
    "user_type"
)
VALUES (
    new_id,
    'Mayor Beth',
    'ADMIN'
);
end $$;