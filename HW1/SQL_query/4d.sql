select themes.name name_of_theme, avg(sets.num_parts) avg_num_parts_of_set 
from themes, sets
where themes.id = sets.theme_id
group by themes.id
order by avg_num_parts_of_set asc
