select themes.name name_of_theme, count(sets.name)
from themes, sets
where themes.id = sets.theme_id
group by themes.name
having count(sets.name) = (
    select max(num_of_set)
    from (select count(sets.name) num_of_set
          from themes, sets
          where themes.id = sets.theme_id
          group by themes.name
    ) 
)
