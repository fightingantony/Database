with colorrank as (
    select themes.name theme_name, colors.name most_used_color,
	       rank() over (partition by themes.id order by sum(inventory_parts.quantity) desc)  color_rank
    from themes
    join sets on themes.id = sets.theme_id
    join inventories on sets.set_num = inventories.set_num
    join inventory_parts on inventories.id = inventory_parts.inventory_id
    join colors on inventory_parts.color_id = colors.id
    group by themes.id, colors.name
)
select theme_name, most_used_color
from colorrank
where color_rank = 1
order by theme_name asc;
