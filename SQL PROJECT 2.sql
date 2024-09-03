create database museumdata2;
use museumdata2;
show tables;

select * from artist;



-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.
select  full_name, m.name from artist a
inner join work w on
a.artist_id=w.artist_id 
inner join museum m on
w.museum_id=m.museum_id ;




-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, 
-- ordered by the count in descending order.
select full_name, count(w.work_id) as workcount from artist a
left join work w on
a.artist_id=w.artist_id
group by full_name
order by workcount desc;


-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.

select m.name, count(w.work_id) as totalworks from museum m
left join work w on
m.museum_id=w.museum_id
group by m.name
order by totalworks desc
limit 5;


-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. 
-- Limit the results to 10.

select w.name, w.style, m.name from work w 
inner join museum m on
m.museum_id=w.museum_id
order by m.name asc
limit 10;




-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the 
-- total sale price in descending order.
select a.full_name ,concat(p.sale_price) as total_sale_price from artist a
inner join work w on
w.artist_id=a.artist_id 
inner join product_size p on
p.work_id=w.work_id
order by total_sale_price desc;


-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.
select a.full_name, count(w.work_id) as workcount from artist a
inner join work w on
w.artist_id=a.artist_id
group by full_name
having workcount>3
order by workcount; 



-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 
select a.full_name as artistname, w.name as worksname ,p.sale_price,p.regular_price from artist a
inner join work w on
w.artist_id=a.artist_id
inner join product_size p on
w.work_id=p.work_id
having p.sale_price < p.regular_price;


-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.
select avg(height) as avgheight,
avg(width) as avgwidth from canvas_size;




-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.
select max(p.sale_price) as max_sale_price, m.name as museum_name from museum m
inner join work w on
m.museum_id=w.museum_id
inner join product_size p on 
p.work_id=w.work_id
group by museum_name;


-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. 
-- Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.

select * from artist;
select  concat_ws(' ',a.first_name,a.last_name,',',a.nationality) as artist_name,
count(w.work_id)  as workcount
from artist a
inner join work w on
w.artist_id=a.artist_id
group by artist_name
order by workcount desc;


