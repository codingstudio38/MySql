SELECT COUNT(userId) AS total_records,(SELECT SUM(latitude) FROM `pinned_businesses`) as total_lat,(SELECT MAX(latitude)
FROM `pinned_businesses`) as max_lat,(SELECT MIN(latitude) FROM `pinned_businesses`) as min_lat,(SELECT AVG(latitude)
FROM `pinned_businesses`) as ave_lat FROM `pinned_businesses`;


SELECT * FROM `auth_users` u INNER JOIN `profiles` p ON u.id=p.user_id INNER JOIN `posts` po ON u.id=po.category_id;
SELECT * FROM `auth_users` u INNER JOIN `profiles` p ON u.id=p.user_id RIGHT JOIN `posts` po ON u.id=po.category_id;
SELECT * FROM `auth_users` u INNER JOIN `profiles` p ON u.id=p.user_id LEFT JOIN `posts` po ON u.id=po.category_id;
SELECT * FROM `auth_users` CROSS JOIN `posts`;


mysql -u root -p -h localhost
-----------string function in mysql start----------------
select id,name, upper(name) as uppername from categories;
select id,name, ucase(name) as uppername from categories;

select id,name, lower(name) as lowername from categories;
select id,name, lcase(name) as lowername from categories;

MariaDB [reactapp]> select id,name, character_length(name) as total from categories;
+----+-------------+-------+
| id | name | total |
+----+-------------+-------+
| 13 | Appliances | 10 |
| 14 | Electronics | 11 |
| 15 | Fashion | 7 |
+----+-------------+-------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,name, char_length(name) as total from categories;
+----+-------------+-------+
| id | name | total |
+----+-------------+-------+
| 13 | Appliances | 10 |
| 14 | Electronics | 11 |
| 15 | Fashion | 7 |
+----+-------------+-------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,name, length(name) as total from categories;
+----+-------------+-------+
| id | name | total |
+----+-------------+-------+
| 13 | Appliances | 10 |
| 14 | Electronics | 11 |
| 15 | Fashion | 7 |
+----+-------------+-------+
3 rows in set (0.011 sec)

MariaDB [reactapp]> select id,name, concat(name,"-",id) as total from categories;
+----+-------------+----------------+
| id | name | total |
+----+-------------+----------------+
| 13 | Appliances | Appliances-13 |
| 14 | Electronics | Electronics-14 |
| 15 | Fashion | Fashion-15 |
+----+-------------+----------------+
3 rows in set (0.000 sec)


MariaDB [reactapp]> select id,name, concat_ws("-",name,id) as total from categories;
+----+-------------+----------------+
| id | name | total |
+----+-------------+----------------+
| 13 | Appliances | Appliances-13 |
| 14 | Electronics | Electronics-14 |
| 15 | Fashion | Fashion-15 |
+----+-------------+----------------+
3 rows in set (0.000 sec)

select id,name, ltirm(name) as ltirm name from categories;
select id,name, rtirm(name) as rtirmname from categories;
select id,name, tirm(name) as tirmname from categories;

MariaDB [reactapp]> select id,name, position("i" in name) as total from categories;
+----+-------------+-------+
| id | name | total |
+----+-------------+-------+
| 13 | Appliances | 5 |
| 14 | Electronics | 9 |
| 15 | Fashion | 5 |
+----+-------------+-------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,name, instr(name,"i") as total from categories;
+----+-------------+-------+
| id | name | total |
+----+-------------+-------+
| 13 | Appliances | 5 |
| 14 | Electronics | 9 |
| 15 | Fashion | 5 |
+----+-------------+-------+
3 rows in set (0.001 sec)

MariaDB [reactapp]> select id,name, locate("i",name,5) as total from categories;
+----+-------------+-------+
| id | name | total |
+----+-------------+-------+
| 13 | Appliances | 5 |
| 14 | Electronics | 9 |
| 15 | Fashion | 5 |
+----+-------------+-------+
3 rows in set (0.000 sec)

select id,name, substr(name,3) as total from categories;
MariaDB [reactapp]> select id,name, substring(name,3) as total from categories;
+----+-------------+-----------+
| id | name | total |
+----+-------------+-----------+
| 13 | Appliances | pliances |
| 14 | Electronics | ectronics |
| 15 | Fashion | shion |
+----+-------------+-----------+
3 rows in set (0.001 sec)

MariaDB [reactapp]> select id,name, substring(name,3,6) as total from categories;
+----+-------------+--------+
| id | name | total |
+----+-------------+--------+
| 13 | Appliances | plianc |
| 14 | Electronics | ectron |
| 15 | Fashion | shion |
+----+-------------+--------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,name, mid(name,3,6) as total from categories;
+----+-------------+--------+
| id | name | total |
+----+-------------+--------+
| 13 | Appliances | plianc |
| 14 | Electronics | ectron |
| 15 | Fashion | shion |
+----+-------------+--------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,name, substring_index(name,"i",1) as total from categories;
+----+-------------+----------+
| id | name | total |
+----+-------------+----------+
| 13 | Appliances | Appl |
| 14 | Electronics | Electron |
| 15 | Fashion | Fash |
+----+-------------+----------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,name, left(name,3) as total from categories;
+----+-------------+-------+
| id | name | total |
+----+-------------+-------+
| 13 | Appliances | App |
| 14 | Electronics | Ele |
| 15 | Fashion | Fas |
+----+-------------+-------+
3 rows in set (0.012 sec)

MariaDB [reactapp]> select id,name, right(name,3) as total from categories;
+----+-------------+-------+
| id | name | total |
+----+-------------+-------+
| 13 | Appliances | ces |
| 14 | Electronics | ics |
| 15 | Fashion | ion |
+----+-------------+-------+
3 rows in set (0.000 sec)


MariaDB [reactapp]> select id,name, rpad(name,15,"-") as test from categories;
+----+-------------+-----------------+
| id | name | test |
+----+-------------+-----------------+
| 13 | Appliances | Appliances----- |
| 14 | Electronics | Electronics---- |
| 15 | Fashion | Fashion-------- |
+----+-------------+-----------------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,name, lpad(name,15,"-") as test from categories;
+----+-------------+-----------------+
| id | name | test |
+----+-------------+-----------------+
| 13 | Appliances | -----Appliances |
| 14 | Electronics | ----Electronics |
| 15 | Fashion | --------Fashion |
+----+-------------+-----------------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,name, space(25) as test from categories;
+----+-------------+---------------------------+
| id | name | test |
+----+-------------+---------------------------+
| 13 | Appliances | |
| 14 | Electronics | |
| 15 | Fashion | |
+----+-------------+---------------------------+
3 rows in set (0.011 sec)

MariaDB [reactapp]> select id,name, reverse(name) as test from categories;
+----+-------------+-------------+
| id | name | test |
+----+-------------+-------------+
| 13 | Appliances | secnailppA |
| 14 | Electronics | scinortcelE |
| 15 | Fashion | noihsaF |
+----+-------------+-------------+
3 rows in set (0.013 sec)

MariaDB [reactapp]> select id,name, replace(name,"i","-ok-") as test from categories;
+----+-------------+----------------+
| id | name | test |
+----+-------------+----------------+
| 13 | Appliances | Appl-ok-ances |
| 14 | Electronics | Electron-ok-cs |
| 15 | Fashion | Fash-ok-on |
+----+-------------+----------------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,name, strcmp(name,category_img) as test from categories;
+----+-------------+------+
| id | name | test |
+----+-------------+------+
| 13 | Appliances | -1 |
| 14 | Electronics | 1 |
| 15 | Fashion | 1 |
+----+-------------+------+
3 rows in set (0.001 sec)

MariaDB [reactapp]> select id,name, field("i","o","i","k") as test from categories;
+----+-------------+------+
| id | name | test |
+----+-------------+------+
| 13 | Appliances | 2 |
| 14 | Electronics | 2 |
| 15 | Fashion | 2 |
+----+-------------+------+
3 rows in set (0.000 sec)


MariaDB [reactapp]> select id,name, FIND_IN_set("ram","hello,ram,mohan,and,gopal") as test from categories;
+----+-------------+------+
| id | name | test |
+----+-------------+------+
| 13 | Appliances | 2 |
| 14 | Electronics | 2 |
| 15 | Fashion | 2 |
+----+-------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,name, format(255.50055,2) as test from categories;
+----+-------------+--------+
| id | name | test |
+----+-------------+--------+
| 13 | Appliances | 255.50 |
| 14 | Electronics | 255.50 |
| 15 | Fashion | 255.50 |
+----+-------------+--------+
3 rows in set (0.012 sec)

MariaDB [reactapp]> select id,name, hex(name) as test from categories;
+----+-------------+------------------------+
| id | name | test |
+----+-------------+------------------------+
| 13 | Appliances | 4170706C69616E636573 |
| 14 | Electronics | 456C656374726F6E696373 |
| 15 | Fashion | 46617368696F6E |
+----+-------------+------------------------+
3 rows in set (0.000 sec)

-----------string function in mysql end----------------






















-----------date function in mysql start----------------
MariaDB [reactapp]> select current_date();
+----------------+
| current_date() |
+----------------+
| 2022-09-20 |
+----------------+
1 row in set (0.014 sec)

MariaDB [reactapp]> select curdate();
+------------+
| curdate() |
+------------+
| 2022-09-20 |
+------------+
1 row in set (0.000 sec)

MariaDB [reactapp]> select sysdate();
+---------------------+
| sysdate() |
+---------------------+
| 2022-09-20 07:16:42 |
+---------------------+
1 row in set (0.011 sec)

MariaDB [reactapp]> select now();
+---------------------+
| now() |
+---------------------+
| 2022-09-20 07:17:07 |
+---------------------+
1 row in set (0.000 sec)


MariaDB [reactapp]> select date("2022-09-20 09:36:21") as test;
+------------+
| test |
+------------+
| 2022-09-20 |
+------------+
1 row in set (0.000 sec)

MariaDB [reactapp]> select month("2022-09-20 09:36:21") as test;
+------+
| test |
+------+
| 9 |
+------+
1 row in set (0.011 sec)

MariaDB [reactapp]> select monthname("2022-09-20 09:36:21") as test;
+-----------+
| test |
+-----------+
| September |
+-----------+
1 row in set (0.013 sec)


MariaDB [reactapp]> select id,created_at,year("2022-09-20 09:36:21") as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 2022 |
| 14 | 2022-09-14 02:24:41 | 2022 |
| 15 | 2022-09-14 02:06:46 | 2022 |
+----+---------------------+------+
3 rows in set (0.000 sec)


MariaDB [reactapp]> select id,created_at,quarter(created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 3 |
| 14 | 2022-09-14 02:24:41 | 3 |
| 15 | 2022-09-14 02:06:46 | 3 |
+----+---------------------+------+
3 rows in set (0.001 sec)

MariaDB [reactapp]> select id,created_at,day(created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 14 |
| 14 | 2022-09-14 02:24:41 | 14 |
| 15 | 2022-09-14 02:06:46 | 14 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,dayofmonth(created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 14 |
| 14 | 2022-09-14 02:24:41 | 14 |
| 15 | 2022-09-14 02:06:46 | 14 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,dayname(created_at) as test from categories;
+----+---------------------+-----------+
| id | created_at | test |
+----+---------------------+-----------+
| 13 | 2022-09-14 02:06:46 | Wednesday |
| 14 | 2022-09-14 02:24:41 | Wednesday |
| 15 | 2022-09-14 02:06:46 | Wednesday |
+----+---------------------+-----------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,dayofweek(created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 4(daynumber) |
| 14 | 2022-09-14 02:24:41 | 4(daynumber) |
| 15 | 2022-09-14 02:06:46 | 4(daynumber) |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,dayofyear(created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 257 |
| 14 | 2022-09-14 02:24:41 | 257 |
| 15 | 2022-09-14 02:06:46 | 257 |
+----+---------------------+------+
3 rows in set (0.001 sec)

MariaDB [reactapp]> select id,created_at,week(created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 37 |
| 14 | 2022-09-14 02:24:41 | 37 |
| 15 | 2022-09-14 02:06:46 | 37 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,weekday(created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 2 |
| 14 | 2022-09-14 02:24:41 | 2 |
| 15 | 2022-09-14 02:06:46 | 2 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,yearweek(created_at) as test from categories;
+----+---------------------+--------+
| id | created_at | test |
+----+---------------------+--------+
| 13 | 2022-09-14 02:06:46 | 202237 |
| 14 | 2022-09-14 02:24:41 | 202237 |
| 15 | 2022-09-14 02:06:46 | 202237 |
+----+---------------------+--------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,last_day(created_at) as test from categories;
+----+---------------------+------------+
| id | created_at | test |
+----+---------------------+------------+
| 13 | 2022-09-14 02:06:46 | 2022-09-30 |
| 14 | 2022-09-14 02:24:41 | 2022-09-30 |
| 15 | 2022-09-14 02:06:46 | 2022-09-30 |
+----+---------------------+------------+
3 rows in set (0.011 sec)

MariaDB [reactapp]> select id,created_at,extract(month from created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 9 |
| 14 | 2022-09-14 02:24:41 | 9 |
| 15 | 2022-09-14 02:06:46 | 9 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,extract(day from created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 14 |
| 14 | 2022-09-14 02:24:41 | 14 |
| 15 | 2022-09-14 02:06:46 | 14 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,extract(year from created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 2022 |
| 14 | 2022-09-14 02:24:41 | 2022 |
| 15 | 2022-09-14 02:06:46 | 2022 |
+----+---------------------+------+
3 rows in set (0.001 sec)

MariaDB [reactapp]> select id,created_at,extract(week from created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 37 |
| 14 | 2022-09-14 02:24:41 | 37 |
| 15 | 2022-09-14 02:06:46 | 37 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,extract(hour from created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 2 |
| 14 | 2022-09-14 02:24:41 | 2 |
| 15 | 2022-09-14 02:06:46 | 2 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,extract(minute from created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 6 |
| 14 | 2022-09-14 02:24:41 | 24 |
| 15 | 2022-09-14 02:06:46 | 6 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,extract(second from created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 46 |
| 14 | 2022-09-14 02:24:41 | 41 |
| 15 | 2022-09-14 02:06:46 | 46 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,extract(microsecond from created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 0 |
| 14 | 2022-09-14 02:24:41 | 0 |
| 15 | 2022-09-14 02:06:46 | 0 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,extract(hour_minute from created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 206 |
| 14 | 2022-09-14 02:24:41 | 224 |
| 15 | 2022-09-14 02:06:46 | 206 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,ADDDATE(created_at, interval 10 day) as testdate from categories;
+----+---------------------+---------------------+
| id | created_at | testdate |
+----+---------------------+---------------------+
| 13 | 2022-09-14 02:06:46 | 2022-09-24 02:06:46 |
| 14 | 2022-09-14 02:24:41 | 2022-09-24 02:24:41 |
| 15 | 2022-09-14 02:06:46 | 2022-09-24 02:06:46 |
+----+---------------------+---------------------+
3 rows in set (0.003 sec)

MariaDB [reactapp]> select id,created_at,ADDDATE(created_at, interval 1 month) as testdate from categories;
+----+---------------------+---------------------+
| id | created_at | testdate |
+----+---------------------+---------------------+
| 13 | 2022-09-14 02:06:46 | 2022-10-14 02:06:46 |
| 14 | 2022-09-14 02:24:41 | 2022-10-14 02:24:41 |
| 15 | 2022-09-14 02:06:46 | 2022-10-14 02:06:46 |
+----+---------------------+---------------------+
3 rows in set (0.000 sec)


MariaDB [reactapp]> select id,created_at,DATE_ADD(created_at, interval 1 month) as testdate from categories;
+----+---------------------+---------------------+
| id | created_at | testdate |
+----+---------------------+---------------------+
| 13 | 2022-09-14 02:06:46 | 2022-10-14 02:06:46 |
| 14 | 2022-09-14 02:24:41 | 2022-10-14 02:24:41 |
| 15 | 2022-09-14 02:06:46 | 2022-10-14 02:06:46 |
+----+---------------------+---------------------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,makedate(created_at, 3) as testdate from categories;
+----+---------------------+----------+
| id | created_at | testdate |
+----+---------------------+----------+
| 13 | 2022-09-14 02:06:46 | NULL |
| 14 | 2022-09-14 02:24:41 | NULL |
| 15 | 2022-09-14 02:06:46 | NULL |
+----+---------------------+----------+
3 rows in set (0.013 sec)

MariaDB [reactapp]> select id,created_at,makedate("2022", 3) as testdate from categories;
+----+---------------------+------------+
| id | created_at | testdate |
+----+---------------------+------------+
| 13 | 2022-09-14 02:06:46 | 2022-01-03 |
| 14 | 2022-09-14 02:24:41 | 2022-01-03 |
| 15 | 2022-09-14 02:06:46 | 2022-01-03 |
+----+---------------------+------------+
3 rows in set (0.000 sec)


MariaDB [reactapp]> select id,created_at,subdate(created_at,interval 3 day) as testdate from categories;
+----+---------------------+---------------------+
| id | created_at | testdate |
+----+---------------------+---------------------+
| 13 | 2022-09-14 02:06:46 | 2022-09-11 02:06:46 |
| 14 | 2022-09-14 02:24:41 | 2022-09-11 02:24:41 |
| 15 | 2022-09-14 02:06:46 | 2022-09-11 02:06:46 |
+----+---------------------+---------------------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,datediff("2022-12-11",created_at) as testdate from categories;
+----+---------------------+----------+
| id | created_at | testdate |
+----+---------------------+----------+
| 13 | 2022-09-14 02:06:46 | 88 |
| 14 | 2022-09-14 02:24:41 | 88 |
| 15 | 2022-09-14 02:06:46 | 88 |
+----+---------------------+----------+
3 rows in set (0.000 sec)


MariaDB [reactapp]> select id,created_at,to_days(created_at) as testdate from categories;
+----+---------------------+----------+
| id | created_at | testdate |
+----+---------------------+----------+
| 13 | 2022-09-14 02:06:46 | 738777 |
| 14 | 2022-09-14 02:24:41 | 738777 |
| 15 | 2022-09-14 02:06:46 | 738777 |
+----+---------------------+----------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,from_days(685000) as testdate from categories;
+----+---------------------+------------+
| id | created_at | testdate |
+----+---------------------+------------+
| 13 | 2022-09-14 02:06:46 | 1875-06-20 |
| 14 | 2022-09-14 02:24:41 | 1875-06-20 |
| 15 | 2022-09-14 02:06:46 | 1875-06-20 |
+----+---------------------+------------+
3 rows in set (0.001 sec)

MariaDB [reactapp]> select id,created_at,period_add(685000,5) as testdate from categories;
+----+---------------------+----------+
| id | created_at | testdate |
+----+---------------------+----------+
| 13 | 2022-09-14 02:06:46 | 685005 |
| 14 | 2022-09-14 02:24:41 | 685005 |
| 15 | 2022-09-14 02:06:46 | 685005 |
+----+---------------------+----------+
3 rows in set (0.011 sec)

MariaDB [reactapp]> select id,created_at,period_diff(685000,695000) as testdate from categories;
+----+---------------------+----------+
| id | created_at | testdate |
+----+---------------------+----------+
| 13 | 2022-09-14 02:06:46 | -1200 |
| 14 | 2022-09-14 02:24:41 | -1200 |
| 15 | 2022-09-14 02:06:46 | -1200 |
+----+---------------------+----------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,date_format(created_at,"%Y") as testdate from categories;
+----+---------------------+----------+
| id | created_at | testdate |
+----+---------------------+----------+
| 13 | 2022-09-14 02:06:46 | 2022 |
| 14 | 2022-09-14 02:24:41 | 2022 |
| 15 | 2022-09-14 02:06:46 | 2022 |
+----+---------------------+----------+
3 rows in set (0.012 sec)

MariaDB [reactapp]> select id,created_at,str_to_date("July 10 2019","%M %d %Y") as testdate from categories;
+----+---------------------+------------+
| id | created_at | testdate |
+----+---------------------+------------+
| 13 | 2022-09-14 02:06:46 | 2019-07-10 |
| 14 | 2022-09-14 02:24:41 | 2019-07-10 |
| 15 | 2022-09-14 02:06:46 | 2019-07-10 |
+----+---------------------+------------+
3 rows in set (0.000 sec)

MariaDB [reactapp]>
-----------date function in mysql end----------------






-----------time function in mysql start----------------
MariaDB [reactapp]> select current_time();
+----------------+
| current_time() |
+----------------+
| 07:00:34 |
+----------------+
1 row in set (0.014 sec)

MariaDB [reactapp]> select curtime();
+-----------+
| curtime() |
+-----------+
| 07:00:55 |
+-----------+
1 row in set (0.000 sec)

MariaDB [reactapp]> select current_timestamp();
+---------------------+
| current_timestamp() |
+---------------------+
| 2022-09-30 07:01:43 |
+---------------------+
1 row in set (0.000 sec)

MariaDB [reactapp]> select localtime();
+---------------------+
| localtime() |
+---------------------+
| 2022-09-30 07:02:06 |
+---------------------+
1 row in set (0.000 sec)

MariaDB [reactapp]> select localtimestamp();
+---------------------+
| localtimestamp() |
+---------------------+
| 2022-09-30 07:02:22 |
+---------------------+
1 row in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,time(created_at) as test from categories;
+----+---------------------+----------+
| id | created_at | test |
+----+---------------------+----------+
| 13 | 2022-09-14 02:06:46 | 02:06:46 |
| 14 | 2022-09-14 02:24:41 | 02:24:41 |
| 15 | 2022-09-14 02:06:46 | 02:06:46 |
+----+---------------------+----------+
3 rows in set (0.013 sec)

MariaDB [reactapp]> select id,created_at,hour(created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 2 |
| 14 | 2022-09-14 02:24:41 | 2 |
| 15 | 2022-09-14 02:06:46 | 2 |
+----+---------------------+------+
3 rows in set (0.013 sec)

MariaDB [reactapp]> select id,created_at,minute(created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 6 |
| 14 | 2022-09-14 02:24:41 | 24 |
| 15 | 2022-09-14 02:06:46 | 6 |
+----+---------------------+------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,second(created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 46 |
| 14 | 2022-09-14 02:24:41 | 41 |
| 15 | 2022-09-14 02:06:46 | 46 |
+----+---------------------+------+
3 rows in set (0.013 sec)

MariaDB [reactapp]> select id,created_at,timediff(created_at,"04:06:46") as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | NULL |
| 14 | 2022-09-14 02:24:41 | NULL |
| 15 | 2022-09-14 02:06:46 | NULL |
+----+---------------------+------+
3 rows in set (0.014 sec)

MariaDB [reactapp]> select id,created_at,timediff("04:06:46",created_at) as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | NULL |
| 14 | 2022-09-14 02:24:41 | NULL |
| 15 | 2022-09-14 02:06:46 | NULL |
+----+---------------------+------+
3 rows in set (0.001 sec)

MariaDB [reactapp]> select id,created_at,timediff("04:06:46","06:06:46") as test from categories;
+----+---------------------+-----------+
| id | created_at | test |
+----+---------------------+-----------+
| 13 | 2022-09-14 02:06:46 | -02:00:00 |
| 14 | 2022-09-14 02:24:41 | -02:00:00 |
| 15 | 2022-09-14 02:06:46 | -02:00:00 |
+----+---------------------+-----------+
3 rows in set (0.013 sec)


MariaDB [reactapp]> select id,created_at,addtime(created_at,"5:5.003") as test from categories;
+----+---------------------+-------------------------+
| id | created_at | test |
+----+---------------------+-------------------------+
| 13 | 2022-09-14 02:06:46 | 2022-09-14 07:11:46.003 |
| 14 | 2022-09-14 02:24:41 | 2022-09-14 07:29:41.003 |
| 15 | 2022-09-14 02:06:46 | 2022-09-14 07:11:46.003 |
+----+---------------------+-------------------------+
3 rows in set (0.012 sec)

MariaDB [reactapp]> select id,created_at,addtime(created_at,"1:5:5.003") as test from categories;
+----+---------------------+-------------------------+
| id | created_at | test |
+----+---------------------+-------------------------+
| 13 | 2022-09-14 02:06:46 | 2022-09-14 03:11:51.003 |
| 14 | 2022-09-14 02:24:41 | 2022-09-14 03:29:46.003 |
| 15 | 2022-09-14 02:06:46 | 2022-09-14 03:11:51.003 |
+----+---------------------+-------------------------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,addtime(created_at,"2 1:5:5.003") as test from categories;
+----+---------------------+-------------------------+
| id | created_at | test |
+----+---------------------+-------------------------+
| 13 | 2022-09-14 02:06:46 | 2022-09-16 03:11:51.003 |
| 14 | 2022-09-14 02:24:41 | 2022-09-16 03:29:46.003 |
| 15 | 2022-09-14 02:06:46 | 2022-09-16 03:11:51.003 |
+----+---------------------+-------------------------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,subtime(created_at,"2 1:5:5.003") as test from categories;
+----+---------------------+-------------------------+
| id | created_at | test |
+----+---------------------+-------------------------+
| 13 | 2022-09-14 02:06:46 | 2022-09-12 01:01:40.997 |
| 14 | 2022-09-14 02:24:41 | 2022-09-12 01:19:35.997 |
| 15 | 2022-09-14 02:06:46 | 2022-09-12 01:01:40.997 |
+----+---------------------+-------------------------+
3 rows in set (0.000 sec)

MariaDB [reactapp]> select id,created_at,maketime(16,15,20) as test from categories;
+----+---------------------+----------+
| id | created_at | test |
+----+---------------------+----------+
| 13 | 2022-09-14 02:06:46 | 16:15:20 |
| 14 | 2022-09-14 02:24:41 | 16:15:20 |
| 15 | 2022-09-14 02:06:46 | 16:15:20 |
+----+---------------------+----------+
3 rows in set (0.012 sec)

MariaDB [reactapp]> select id,created_at,timestamp("2022-9-30","13:30:40") as test from categories;
+----+---------------------+---------------------+
| id | created_at | test |
+----+---------------------+---------------------+
| 13 | 2022-09-14 02:06:46 | 2022-09-30 13:30:40 |
| 14 | 2022-09-14 02:24:41 | 2022-09-30 13:30:40 |
| 15 | 2022-09-14 02:06:46 | 2022-09-30 13:30:40 |
+----+---------------------+---------------------+
3 rows in set (0.012 sec)

MariaDB [reactapp]> select id,created_at,time_format(created_at,"%H") as test from categories;
+----+---------------------+------+
| id | created_at | test |
+----+---------------------+------+
| 13 | 2022-09-14 02:06:46 | 02 |
| 14 | 2022-09-14 02:24:41 | 02 |
| 15 | 2022-09-14 02:06:46 | 02 |
+----+---------------------+------+
3 rows in set (0.013 sec)

------------time function in mysql end-----------------



select `id`,`name`,`email`,(select `price` from `meta_data` WHERE FIND_IN_set(`users`.`id`,`meta_data`.`userids`) >= 1)
AS `user_price` from `users`;

SELECT * FROM `users_meta` WHERE `database` LIKE 'users_data' AND `key` LIKE 'pos' AND
FIND_IN_set('wing_shooting_wsh',replace(`value`,", ",",")) >= 1

SELECT * FROM `users_meta` WHERE `database` LIKE 'users_data' AND `key` LIKE 'pos' AND
FIND_IN_set('wing_shooting_wsh',replace(`value`,", ",",")) >= 1

SELECT *,format(`value`,1) as `test` FROM `users_meta` WHERE `database`='users_data' AND `key` LIKE 'ht_tbl' AND
CAST(`value` AS SIGNED) >= 5.10

SELECT *, substring_index(`value`,".",1) as `fit`,substring(`value`,position("." in `value`)+1) as `inch` FROM
`users_meta` WHERE `database`='users_data' AND `key` LIKE 'ht_tbl'

SELECT *, substring_index(`value`,".",1) as `fit`,substring(`value`,position("." in `value`)+1) as `inch` FROM
`users_meta` WHERE `database`='users_data' AND `key` LIKE 'ht_tbl' AND (CAST(substring_index(`value`,".",1) AS SIGNED)
>= 5 OR CAST(substring(`value`,position("." in `value`)+1) AS SIGNED) >= 10)





//////////////////////////////////////////
VIEW COMMAND

-> CREATE VIEW `view_name` AS SELECT * FROM `bank_mst`;

-> SELECT * from myquery;

-> ALTER VIEW `view_name` AS SELECT id,bank_name FROM `bank_mst`;

-> CREATE OR REPLACE VIEW `view_name` AS SELECT id,bank_name FROM `bank_mst`;

-> RENAME TABLE `view_name` TO `new_view_name`;

-> DROP VIEW `view_name`;


//////////////////////////////////////////
INDEX COMMAND

-> CREATE INDEX index_name ON tabel_name(column1,....);
-> DROP INDEX index_name ON tabel_name;  



//////////////////////////////////
CAST() AND CONVERT()->for change data type

SELECT *,convert(created_date,date) as `checkType` FROM angular12.angularuser_tbl;
SELECT *,convert(created_date,date) as `checkType`,CAST(created_date as date) as `c_checkType` FROM angular12.angularuser_tbl;


JSON_OBJECT()---------->
SELECT *,JSON_OBJECT('id', tbl1.id, 'name', tbl1.name, 'email', tbl1.email) as plotDetails
FROM angular12.angularuser_tbl as tbl1;

JSON_ARRAY()---------->
SELECT tbl1.*, 
       (
           #SELECT GROUP_CONCAT(JSON_ARRAY(JSON_OBJECT('id', tbl2.id, 'token', tbl2.tokenable_type, 'tokenable_type', tbl2.tokenable_type)))
           SELECT CONCAT('[',GROUP_CONCAT(JSON_OBJECT('id', tbl2.id, 'token', tbl2.tokenable_type, 'tokenable_type', tbl2.tokenable_type)), ']')
           FROM myblog_logindetails_tbl as tbl2 
           WHERE tbl2.tokenable_id = tbl1.id
       ) as plotDetails
FROM angularuser_tbl as tbl1;



current week start date and end date---------->

SELECT date(DATE_SUB(NOW(), INTERVAL (WEEKDAY(NOW()) ) DAY)) AS week_start_date, 
DAYNAME(date(DATE_SUB(NOW(), INTERVAL (WEEKDAY(NOW()) ) DAY))) AS start_day_name,
date(DATE_ADD(NOW(), INTERVAL (6 - WEEKDAY(NOW())) DAY)) AS week_end_date,
DAYNAME(date(DATE_ADD(NOW(), INTERVAL (6 - WEEKDAY(NOW())) DAY))) AS end_day_name,
DAYNAME(NOW()) AS today_name,
date(NOW()) AS current_date_;


get data useing FIND_IN_SET subquery json data from another table (data like usersid->'1,2,3')---------->
select *,
       (
          SELECT CONCAT('[',GROUP_CONCAT(JSON_OBJECT('intId', tbl2.intId, 'vchFullName', tbl2.vchFullName, 'vchLastName', tbl2.vchLastName,'vchImage',tbl2.vchImage,'vchEmailId',tbl2.vchEmailId,'sss',concat("'",replace(tbl1.vchto,",","','"),"'"))), ']')
           FROM m_admin_user as tbl2 
           WHERE  FIND_IN_SET(tbl2.intId, REPLACE(tbl1.vchto, ',', ',')) > 0
       ) as `users_list`
from  t_message as tbl1;