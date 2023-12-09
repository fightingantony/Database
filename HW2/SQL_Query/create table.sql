/*Create country*/
create table Country	
(
	country_name varchar(100) not null,
	three_letter_country_code char(3) not null,
	jurisdiction varchar(100),
	primary key (three_letter_country_code)
);

/*Create continent*/
create table continent
(
	continent_code char(2) not null,
	continent_name varchar(100),
	primary key (continent_code)
);

/*Create country_continent*/
create table country_continent
(
	three_letter_country_code char(3),
	continent_code char(2),
	primary key(three_letter_country_code, continent_code),
	foreign key (three_letter_country_code) references country(three_letter_country_code),
	foreign key(continent_code) references continent(continent_code)
);

/*Create policy*/
create table policy
(
	three_letter_country_code char(3) not null,
	Date int not null,
	C1M int,
	C1M_Flag int,
	C2M int,
	C2M_Flag int,
	C3M int,
	C3M_Flag int,
	C4M int,
	C4M_Flag int,
	C5M int,
	C5M_Flag int,
	C6M int,
	C6M_Flag int,
	C7M int,
	C7M_Flag int,
	C8EV int,
	E1 int,
	E1_Flag int,
	E2 int,
	E3 float,
	E4 float,
	H1 int,
	H1_Flag int,
	H2 int,
	H3 int,
	H4 float,
	H5 float,
	H6M int,
	H6M_Flag int,
	H7 int,
	H7_Flag int,
	H8M int,
	H8M_Flag int,
	M1 int,
	V1 int,
	V2A int,
	V2B varchar(20),
	V2C varchar(20),
	V2D int,
	V2E int,
	V2F int,
	V2G int,
	V3 int,
	V4 int,
	primary key (three_letter_country_code, Date),
	foreign key (three_letter_country_code) references country(three_letter_country_code)
);

/*Create cases*/
create table cases
(
	three_letter_country_code char(3) not null,
	Date int not null,
	ConfirmedCases float,
	ConfirmedDeaths float,
	MajorityVaccinated varchar(10),
	PopulationVaccinated varchar(10),
	primary key (three_letter_country_code, Date),
	foreign key (three_letter_country_code) references country(three_letter_country_code)
);

/*Create index*/
create table index
(
	three_letter_country_code char(3) not null,
	date int not null,
	StringencyIndex_Average DOUBLE PRECISION,
	StringencyIndex_Average_ForDisplay DOUBLE PRECISION,
	GovernmentResponseIndex_Average DOUBLE PRECISION,
	GovernmentResponseIndex_Average_ForDisplay DOUBLE PRECISION,
	ContainmentHealthIndex_Average DOUBLE PRECISION,
	ContainmentHealthIndex_Average_ForDisplay DOUBLE PRECISION,
	EconomicSupportIndex DOUBLE PRECISION,
	EconomicSupportIndex_ForDisplay DOUBLE PRECISION,
	primary key (three_letter_country_code, date),
	foreign key (three_letter_country_code) references country(three_letter_country_code)
);

/*Create orginal table(country_and_continent_codes_list)*/
create table country_and_continent_codes_list
(
    continent_name              varchar(100),
    continent_Code              char(2),
    country_Name                varchar(100),
    two_letter_country_code     char(2),
    three_letter_country_code   char(3),
    Country_Number              int
);

/*Create original table(oxcgrt_nat_latest)*/
create table OxCGRT_nat_latest
(
    CountryName         varchar(100),
    CountryCode         char(3),
    Jurisdiction        varchar(20),
    Date                int,
    C1M                 int,
    C1M_Flag            int,
    C2M                 int,
    C2M_Flag            int,
    C3M                 int,
    C3M_Flag            int,
    C4M                 int,
    C4M_Flag            int,
    C5M                 int,
    C5M_Flag            int,
    C6M                 int,
    C6M_Flag            int,
    C7M                 int,
    C7M_Flag            int,
    C8EV                int,
    E1                  int,
    E1_Flag             int,
    E2                  int,
    E3                  FLOAT,
    E4                  FLOAT,
    H1                  int,
    H1_Flag             int,
    H2                  int,
    H3                  int,
    H4                  FLOAT,
    H5                  FLOAT,
    H6M                 int,
    H6M_Flag            int,
    H7                  int,
    H7_Flag             int,
    H8M                 int,
    H8M_Flag            int,
    M1                  int,
    V1                  int,
    V2A                 int,
    V2B                 varchar(20),
    V2C                 varchar(20),
    V2D                 int,
    V2E                 int,
    V2F                 int,
    V2G                 int,
    V3                  int,
    V4                  int,
    ConfirmedCases	                            float,
    ConfirmedDeaths	                            float,
    MajorityVaccinated	                        varchar(10),
    PopulationVaccinated                        varchar(10),
    StringencyIndex_Average                     double precision,
    StringencyIndex_Average_ForDisplay          double precision,
    GovernmentResponseIndex_Average             double precision,
    GovernmentResponseIndex_Average_ForDisplay  double precision,
    ContainmentHealthIndex_Average              double precision,
    ContainmentHealthIndex_Average_ForDisplay   double precision,
    EconomicSupportIndex                        double precision,
    EconomicSupportIndex_ForDisplay             double precision,
    primary key (CountryName, Date)
);
