with Old_MovingAverage_Country as(
		select
			date_,
			three_letter_country_code,
			ConfirmedCases,
			(ConfirmedCases - LAG(ConfirmedCases, 7) over (partition by three_letter_country_code
			order by date_ rows between 7 preceding and current row)) / 7 as Moving_Average
		from cases
	),
    MovingAverage_Country as(
        select
            date_,
			three_letter_country_code,
			GREATEST(Moving_Average, 0.1) as Moving_Average
        from
            Old_MovingAverage_Country
			where date_ in (20220401)
    ),
	OverStringencyIndices as(
		select
			index_continent.Date_,
			index_continent.three_letter_country_code,
            index_continent.Continent_Code,
			index_continent.StringencyIndex_Average_ForDisplay / MovingAverage_Country.Moving_Average as OverStringencyIndex
		from MovingAverage_Country left join index_continent
		on (MovingAverage_Country.three_letter_country_code = index_continent.cc_three_letter_country_code 
			and MovingAverage_Country.date_ = index_continent.date_)
	),
    maxmin_OverStringencyIndices(Date_, Continent_Code, Maximum, Minimum) as(
	select
		Date_,
		Continent_Code,
		MAX(OverStringencyIndex),
		Min(OverStringencyIndex)
	from OverStringencyIndices
	group by date_, Continent_Code
	),
	find_country_code as(
	select
		mmo.Date_,
		mmo.Continent_Code,
		Maxcc.three_letter_country_code as Max_CountryCode,
		mmo.Maximum,
		Mincc.three_letter_country_code as Min_CountryCode,
		mmo.Minimum
	from
		maxmin_OverStringencyIndices as mmo
		left join OverStringencyIndices as Maxcc
			on (mmo.Maximum = Maxcc.OverStringencyIndex 
				and mmo.Date_ = Maxcc.Date_
			   	and mmo.Continent_Code = Maxcc.Continent_Code)
		left join OverStringencyIndices as Mincc
			on (mmo.Minimum = Mincc.OverStringencyIndex 
				and mmo.Date_ = Mincc.Date_
			   	and mmo.Continent_Code = Mincc.Continent_Code)
	)
		
select
	F.Date_ as date,
	MaCC.Continent_Name,
	MaCC.Country_Name as Max_Country_Name,
	F.Maximum as Max_Stringency_Index, 
	MiCC.Country_Name as Min_Country_Name,
	F.Minimum as Min_Stringency_Index
from
	find_country_code as F
	left join Country_and_Continent as MaCC
		on (F.Max_CountryCode = MaCC.three_letter_country_code)
	left join Country_and_Continent as MiCC
		on (F.Min_CountryCode = MiCC.three_letter_country_code)
order by F.Continent_code
	
