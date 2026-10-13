SELECT * FROM books WHERE genre = 'Fiction'; 
-- imi returneaza toate cartile ce au genul fiction

SELECT books.title, books.author FROM books;
-- returneaza toate titlurile si autorii

SELECT books.title as 'Titlu', books.author as 'Autor', books.price 'Pret' from books;
-- returneaza datele cu cele 3 fielduri redenumite.

SELECT * FROM books where  genre = 'programming';
-- returneaza cartile cu genul 'programming'

SELECT * FROM books where  NOT genre = 'fiction';
-- returneaza cartile care NU au genul 'fiction'

SELECT * FROM books where pages > 500;
-- returneaza cartile care au peste 500 pagini.

SELECT * from books where year_published < 1950;
-- returneaza cărțile publicate înainte de 1950

SELECT * from books where price > 100;
-- returneaza cartile cu pretul mai mare de 100RON

SELECT * from books where genre='fantasy' AND pages>500;
-- returneaza cartile din genul fantasy cu peste 500pag.

SELECT * from books where author='Yuval Noah Harari' OR author ='Walter Isaacson';
-- Cărțile scrise de  'Yuval Noah Harari'  sau de  'Walter Isaacson'

Select * from books where genre IN ('Science', 'History', 'Biography');
-- Cărțile din genurile  'Science' ,  'History'  sau  'Biography' , cu  IN .

select * from books where genre NOT in('Programming', 'fiction');
-- Cărțile care nu sunt nici  'Programming' , nici  'Fiction' , cu  NOT IN 

select *
from books where price between 50 AND 100;
--Cărțile cu prețul între 50 și 100 RON, inclusiv.

select *
from books where year_published BETWEEN 2000 and 2020;
--Cărțile publicate între 2000 și 2020

select *
from books where title LIKE 'The%';

select *
from books where author LIKE '%Harari%';

select *
from books where title LIKE '%Code' OR title LIKE '%JS';

select *
from books where rating is NULL;

select *
from books where pages is null;

select *
from books where rating is not null and in_stock is true;

select *
from books where genre = 'programming' AND rating >=4.3 and in_stock=true;

select *
from books where title Like '%JS%' or title like '%Java%' and year_published>2010;

select books.title, books.rating
from books where rating is not null and in_stock=true order by rating desc;

select books.title, books.rating, books.price
from books where rating is not null and in_stock=true order by price;

select *, CASE
    when (books.rating is null and books.pages is null) then 'rating and pages'
    when books.rating is null then 'rating'
    when books.pages is null then 'pages'
    else 'ok'
end as missing_field
from books
where rating is null or pages is null;


select * from books where price>120 and (rating is null or rating < 4.0);

--# //Campanie: cărți din  'Programming'  sau  'Science' , publicate după 2000, în stoc, sub 150 RON.
select * from books where genre in('programming', 'Science') and year_published > 2000 and in_stock=true and price<150;

--# Valori suspecte: peste 600 de pagini și preț sub 70 RON.
select title, author, pages, price from books where pages > 600 and price < 70;

--# Titlurile care încep cu  'The '  și nu sunt în stoc.
select books.title, books.in_stock from books where title like 'The%' and in_stock=false;

--# Cărțile din  'Biography'  sau  'History'  fără rating, cele mai noi primele.
select books.title, books.author, books.genre, books.year_published, books.rating
from books
where genre in ('Biography', 'History')
  and rating is null
order by year_published desc;

--#  Cărțile care nu sunt în stoc, dar au rating de cel puțin 4.3
select books.title, books.author, books.genre, books.in_stock, books.rating
from books
where books.in_stock = false
  and rating >= 4.3;

--# Cărțile publicate înainte de 1900 și mai scumpe de 100 RON
select books.title, books.author, books.genre, books.year_published, books.price
from books
where year_published < 1900
  and price > 100;

--# Trei query-uri separate pe benzi de preț:  [0, 50] ,  (50, 100] ,  > 100
select books.price from books where price between 0 and 50;
select books.price from books where price between 51 and 100;
select books.price from books where price > 100;


--# Cărțile din  'Programming'  sau  'Fantasy'  cu peste 450 de pagini și rating peste 4.5.
select books.title, books.author from books where genre in('Programming', 'fantasy') and pages >450 and rating>4.5;

--# Autorii care au un punct ( . ) în nume
select books.title, books.author, books.genre from books where author like '%.%';

