select count(set_num) num_of_set_each_year, year
from sets
where sets.year between '1950' and '2017'
group by year
order by num_of_set_each_year desc