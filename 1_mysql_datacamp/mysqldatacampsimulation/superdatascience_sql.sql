

--
select *
from console_games
limit 10;

--add an extral column of globa_sales to the database
Alter Table console_games
add column global_sales float8;

--filling the global_sales with the sum of the three sales 
update console_games
set global_sales = na_sales + eu_sales + jp_sales + other_sales

--Addition of percentage tabele 
Alter Table console_games
add column na_sales_percent float8;

--calcultae the sales %
update console_games
set na_sales_percent = na_sales/global_sales
where global_sales > 0


-- Ranking the selection with the game_rank 
select *
from console_games 
order by game_rank;


--confirm the lenght of character 
select game_name, length(game_name)
from console_games

--Using the left and right to extract characters 
select publisher, left(publisher, 4), genre
from console_games


--Using the right to extract 
select game_name, right(game_name, 5)
from console_games

--computing the number of days 
select *, (discontinued - first_retail_availability)/365 as days_existed
from console_dates

--selec base on year 
select *, date_part('year', discontinued) - date_part('year', first_retail_availability) as years_existed
from console_dates

--
SELECT *, AGE(discontinued, first_retail_availability) AS platform_alive
from console_dates

--
select game_year ::varchar(4)
from console_games

--






























































