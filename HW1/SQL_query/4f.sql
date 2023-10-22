with theme_color_count as (
	select themes.name name_of_theme, colors.name name_of_color, sum(inventory_parts.quantity) color_count
	from themes, colors, sets, inventories, inventory_parts
	where themes.id = sets.theme_id and colors.id = inventory_parts.color_id
		  and sets.set_num = inventories.set_num and inventories.id = inventory_parts.inventory_id
	group by themes.name, colors.name
),
max_color_count as(
	select name_of_theme, name_of_color, color_count, 
		   rank() over (partition by name_of_theme order by color_count desc) as color_rank
	from theme_color_count
)
select name_of_theme, name_of_color most_used_color
from max_color_count
where color_rank = 1
