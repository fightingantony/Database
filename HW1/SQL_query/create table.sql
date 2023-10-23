COPY colors(id, name, rgb, is_trans)
FROM 'D:\PostgreSQL\archive\colors.csv' DELIMITER ',' CSV HEADER;

COPY themes(id,name,parent_id)
FROM 'D:\PostgreSQL\archive\themes.csv' DELIMITER ',' CSV HEADER;

COPY part_categories(id, name)
FROM 'D:\PostgreSQL\archive\part_categories.csv' DELIMITER ',' CSV HEADER;

COPY sets(set_num,name,year,theme_id,num_parts)
FROM 'D:\PostgreSQL\archive\sets.csv' DELIMITER ',' CSV HEADER;

COPY parts(part_num, name, part_cat_id)
FROM 'D:\PostgreSQL\archive\parts.csv' DELIMITER ',' CSV HEADER;

COPY inventories(id, version, set_num)
FROM 'D:\PostgreSQL\archive\inventories.csv' DELIMITER ',' CSV HEADER;

COPY inventory_sets(inventory_id, set_num, quantity)
FROM 'D:\PostgreSQL\archive\inventory_sets.csv' DELIMITER ',' CSV HEADER;

COPY inventory_parts(inventory_id, part_num, color_id, quantity, is_spare)
FROM 'D:\PostgreSQL\archive\inventory_parts.csv' DELIMITER ',' CSV HEADER;
