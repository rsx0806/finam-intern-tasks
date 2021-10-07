# Тестовое задание ФИНАМ
1) Задача FooBar - Решение [run.php](run.php)
2) Форма обратной связи - Решение [form.html](form.html)
3) Задача Фонотека - Дамп [database.sql](database.sql)

3 задача запрос 1 :
```
select
    distinct songs.name as song, singers.name as singer, songs.duration as duration, songs.release_date as release_date
from 
    songs
    inner join singers on singers.singer_id = songs.singer
    inner join genres on genres.genre_id = ANY (songs.genre)
where 1 = ANY (songs.genre)
order by songs.release_date desc limit 10;
```
3 задача запрос 2 :
```
select 
    count(*) as songs_count, singers.name 
from
    songs 
    inner join singers on singers.singer_id = songs.singer
group by singers.name order by songs_count desc limit 5;
```
