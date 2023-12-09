/*copy original data(psql)*/
\copy country_and_continent_codes_list from 'D:\PostgreSQL\bin\country-and-continent-codes-list-csv.csv' DELIMITER  ','  CSV HEADER;
\copy oxcgrt_nat_latest from 'D:\PostgreSQL\bin\OxCGRT_nat_latest.csv' DELIMITER ',' CSV HEADER;

/*import country*/
insert into Country
select distinct Country_Name, Three_Letter_Country_Code, Jurisdiction
from country_and_continent_codes_list, OxCGRT_nat_latest;
UPDATE Country
SET Country_Name = OxCGRT_nat_latest.CountryName
FROM OxCGRT_nat_latest
where OxCGRT_nat_latest.CountryCode = Country.Three_Letter_Country_Code;

/*import continent*/
insert into Continent
select distinct Continent_Code, Continent_Name
from country_and_continent_codes_list;


/*import country_continent*/
insert into Country_Continent
select distinct Three_Letter_Country_Code, Continent_Code
from country_and_continent_codes_list;


/*import policy*/
insert into Policy_ 
select distinct
    Three_Letter_Country_Code,
    Date_,
    C1M,
	C1M_Flag,
    C2M,
	C2M_Flag,
    C3M,
	C3M_Flag,
    C4M,
	C4M_Flag,
    C5M,
	C5M_Flag,
    C6M,
	C6M_Flag,
    C7M,
	C7M_Flag,
    C8EV,
    E1,
	E1_Flag,
    E2,
    E3,
    E4,
    H1,
	H1_Flag,
    H2,
    H3,
    H4,
    H5,
    H6M,
	H6M_Flag,
    H7,
	H7_Flag,
    H8M,
	H8M_Flag,
    M1,
    V1,
    V2A,
	V2B,
    V2C,
    V2D,
    V2E,
    V2F,
    V2G,
    V3,
    V4
from OxCGRT_nat_latest join Country on OxCGRT_nat_latest.CountryCode = Country.Three_Letter_Country_Code;


/*import cases*/
insert into cases
select distinct Three_letter_country_code, 
				Date_, 
				ConfirmedCases,
				ConfirmedDeaths, 
				MajorityVaccinated,
				PopulationVaccinated
from oxcgrt_nat_latest join country on OxCGRT_nat_latest.CountryCode = Country.Three_Letter_Country_Code;

/*import index_*/
insert into Index_
select distinct
    Three_Letter_Country_Code,
    Date_,
	StringencyIndex_Average,
	StringencyIndex_Average_ForDisplay,
	GovernmentResponseIndex_Average,
    GovernmentResponseIndex_Average_ForDisplay,
	ContainmentHealthIndex_Average,
    ContainmentHealthIndex_Average_ForDisplay,
	EconomicSupportIndex,
    EconomicSupportIndex_ForDisplay
from OxCGRT_nat_latest join Country on OxCGRT_nat_latest.CountryCode = Country.Three_Letter_Country_Code;
