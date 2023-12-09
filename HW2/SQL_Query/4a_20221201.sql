with StringencyIndex(Date_, Continent_Code, Maximum, Minimum) as (
    SELECT
        date_,
        continent_code,
        MAX(StringencyIndex_Average_ForDisplay) as Maximum,
        MIN(StringencyIndex_Average_ForDisplay) as Minimum
    from index_continent
    where date_ in (20221201)
    group by date_, continent_code
	),
	Find_Country_Code as (
    select
        SI.Date_,
        SI.Continent_Code,
        MaxCountryCode.cc_three_letter_country_code as MaCC,
        SI.Maximum,
        MinCountryCode.cc_three_letter_country_code as MiCC,
        SI.Minimum
    from
        StringencyIndex as SI
        left join index_continent as MaxCountryCode
            ON (SI.Maximum = MaxCountryCode.StringencyIndex_Average_ForDisplay 
                and SI.Date_ = MaxCountryCode.date_ and SI.Continent_Code = MaxCountryCode.continent_code)
        left join index_continent as MinCountryCode
            ON (SI.Minimum = MinCountryCode.StringencyIndex_Average_ForDisplay 
                and SI.Date_ = MinCountryCode.date_ and SI.Continent_Code = MinCountryCode.continent_code)
    order by SI.Date_, SI.Continent_Code
)

select
    F.Date_ as Date,
    MaxCC.Continent_Name,
    MaxCC.Country_Name as Max_Country_Name,
    F.Maximum as Max_Stringency_Index, 
    MinCC.Country_Name as Min_Country_Name,
    F.Minimum as Min_Stringency_Index
from
    Find_Country_Code as F
    left join Country_and_Continent as MaxCC
        on (F.MaCC = MaxCC.three_letter_country_code
            and F.Continent_Code = MaxCC.Continent_Code)
    left join Country_and_Continent as MinCC
        on (F.MiCC = MinCC.three_letter_country_code
            and F.Continent_Code = MinCC.Continent_Code)
order by F.Date_, MaxCC.Continent_Name;
