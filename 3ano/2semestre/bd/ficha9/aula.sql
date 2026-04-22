-- 1
CREATE USER 'user_leitura'@'localhost' IDENTIFIED BY 'Leite@1234';

CREATE USER 'analista'@'localhost' IDENTIFIED BY 'Anal@1234';

-- 2

ALTER USER 'user_leitura'@'localhost' IDENTIFIED BY 'NovaPassword@1234' PASSWORD EXPIRE INTERVAL 90 DAY;

-- 3

SELECT *
FROM mysql.user;

-- 4

Create role 'leitor';
create role 'editor';

-- 5

grant 'leitor' to 'user_leitura'@'localhost0';


-- 6

grant select on sekila.* to 'leitor';

-- 7

Grant select,insert,update on  sekila.customer to 'editor';
Grant select,insert,update on  sekila.rental to 'editor';

-- 8

grant 'editor' to 'analista'@'localhost';

-- 9

set default role 'editor' to 'analista'@'localohost';

-- 10

Revoke update on sekira.customer From 'editor';

use sakila;