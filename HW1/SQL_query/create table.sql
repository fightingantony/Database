CREATE Table colors 
(
	  id varchar(4),
    name varchar(50),
    rgb char(6),
    is_trans boolean,
    primary key (id)
);
/*Select 'id' as the primary key because it's unique.*/

CREATE Table themes
(
	id varchar(3),
    name varchar(100),
    parent_id varchar(3),
    primary key (id)
);
/*Select 'id' as the primary key because it's unique.*/

CREATE Table part_categories
(
    id varchar(2),
    name varchar(100),
    primary key (id)
);
/*Select 'id' as the primary key because it's unique.*/

CREATE Table sets
(
	set_num varchar(20),
    name varchar(100),
    year varchar(4),
    theme_id varchar(4),
    num_parts int,
    primary key (set_num),
    foreign key (theme_id) references themes(id)
);
/*Select 'set_num' as the primary key because it's unique.*/
/*Select 'theme_id' as a foreign key reference from the 'themes' table.*/

CREATE Table parts
(
    part_num varchar(15),
    name varchar(300),
    part_cat_id varchar(2),
    primary key (part_num),
    foreign key (part_cat_id) references part_categories(id)
);
/*Select 'part_num' as the primary key because it's unique.*/
/*Select 'part_cat_id' as a foreign key reference from the 'part_categories' table.*/

CREATE Table inventories
(
		id varchar(5),
    version int,
    set_num varchar(20),
    primary key (id),
    foreign key (set_num) references sets(set_num)
);
/*Select 'id' as the primary key because it's unique.*/
/*Select 'set_num' as a foreign key reference from the 'sets' table.*/

CREATE Table inventory_sets
(
		inventory_id varchar(5),
    set_num varchar(20),
    quantity int,
    foreign key (inventory_id) references inventories(id),
    foreign key (set_num) references sets(set_num)
);
/*No primary key because there are no unique attributes in the 'inventory_sets' table*/
/*Select 'inventory_id' as a foreign key reference from the 'inventories' table.*/
/*Select 'set_num' as a foreign key reference from the 'sets' table.*/

CREATE Table inventory_parts
(
    inventory_id varchar(5),
    part_num varchar(15),
    color_id varchar(4),
    quantity int,
    is_spare boolean,
    foreign key (inventory_id) references inventories(id),
    foreign key (color_id) references colors(id)
);
/*No primary key because there are no unique attributes in the 'inventory_parts' table*/
/*Select 'inventory_id' as a foreign key reference from the 'inventories' table.*/
/*Select 'color_id' as a foreign key reference from the 'colors' table.*/
