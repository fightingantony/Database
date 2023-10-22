select colors.name name_of_color, count(distinct inventory_parts.part_num) unique_part_count
from colors, inventory_parts
where colors.id = inventory_parts.color_id
group by colors.name
order by unique_part_count desc
limit 10