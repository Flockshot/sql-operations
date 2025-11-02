SELECT username, name, surname, dob
FROM Userp;


SELECT id, price, cpu, gpu
FROM Computer
WHERE price>15000
AND time_bought>TO_DATE('30-01-2022','DD-MM-YYYY')
AND maintenance_date>TO_DATE('10-06-2022','DD-MM-YYYY');


SELECT name, surname
FROM Userp u, UserSubscription us
WHERE start_date>TO_DATE('01-01-2022','DD-MM-YYYY')
AND u.username=us.username;


SELECT name, surname, game_id
FROM Userp u, Library l, LibraryGame lg
WHERE l.library_connection_token=lg.library_connection_token
AND u.username=l.username;


SELECT name, surname
FROM Userp u, Game g, PlaySession p, Library l, Computer c
WHERE game_name='Assassins Creed Valhalla'
AND p.game_id=g.game_id
AND p.start_date>TO_DATE('17-10-2022','DD-MM-YYYY')
AND p.library_connection_token=l.library_connection_token
AND u.username=l.username
AND p.computer_id=c.id
AND gpu='Nvdia RTX 3090';


SELECT u.name, u.surname, SUM((24*(p.end_date-p.start_date))) AS playtime_hours
FROM Userp u, Game g, PlaySession p, Library l
WHERE game_name='Assassins Creed Valhalla'
AND p.game_id=g.game_id
AND p.library_connection_token=l.library_connection_token
AND u.username=l.username
GROUP BY u.name, u.surname;






