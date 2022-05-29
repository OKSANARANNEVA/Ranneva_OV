Задача 1

USE vk;
SELECT 
from_user_id,
(select concat(firstname, ' ', lastname)
from users where id=messages.from_user_id) as name,
count(*) as cnt
FROM messages
WHERE to_user_id = 1 and from_user_id in (
select initiator_user_id from friend_requests
where (target_user_id = 1) and status='approved'
union
select target_user_id from friend_requests
where (initiator_user_id = 1) and status='approved'
)
GROUP BY from_user_id
ORDER BY cnt DESC 
LIMIT 1; 

Задача 2. 
SELECT COUNT(*) 
from likes
where media_id in (
select id
from medis
where user_id in (
select 
user_id
FROM profiles as p
WHERE timestampdiff(YEAR,birthday,NOW()) < 11)
);
 
Задача 3.
    
SELECT 
    gender
    , count (*)
    from (
    select
    user_id as user,
    (
    select gender
    from profiles
    where user_id = user
    ) as gender
    from likes
    ) as dummy
    group by gender;