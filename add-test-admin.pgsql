INSERT into rcglavc."Logins"(
    "id",
    "email",
    "password"
)
VALUES (
    1,
    'mayor@example.com',
    crypt('dancingpaint', gen_salt('bf'))
);

INSERT INTO rcglavc."Users"(
    "login_id",
    "name",
    "type"
)
VALUES (
    1,
    'Mayor Beth',
    'ADMIN'
);