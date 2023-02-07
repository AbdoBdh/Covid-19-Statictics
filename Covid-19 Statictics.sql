
---- Show The Database


Select *
From dbo.['New Vaccination Data$']
where Continent is null
order by 2,3


--- Select the neccesary data

Select Continent, Location, date, Population, [New Cases], [New Deaths], [New Vaccinations], [Total Cases], [Total Deaths],
[People Fully Vaccinated] ,[People Vaccinated]
from dbo.['New Vaccination Data$']
Where continent is not null 
group by date, Continent, Location, Population, [New Cases], [New Deaths], [New Vaccinations], [Total Cases], [Total Deaths],
[People Fully Vaccinated],[People Vaccinated]
order by [People Vaccinated] desc




--- Total cases vs total deaths and Deaths Percentae over InfectionsCount Per Country

Select Continent, Location, max([Total Cases]) as HighestIfectionCount, max([Total Deaths]) as HighestDeathsCount, 
(max([Total Deaths]) / max([Total Cases]))*100 as DeathsPercentageOverInfections
from dbo.['New Vaccination Data$']
Where continent is not null
group by Continent, Location
order by HighestIfectionCount desc



--- Total cases vs total deaths and Deaths Percentae over InfectionsCount Per Continent

Select Location, max([Total Cases]) as HighestIfectionCount, max([Total Deaths]) as HighestDeathsCount, 
(max([Total Deaths]) / max([Total Cases]))*100 as DeathsPercentageOverInfections
from dbo.['New Vaccination Data$']
Where Location in ('Asia', 'Europe', 'North America', 'South America', 'Africa', 'Oceania') 
group by Location
order by DeathsPercentageOverInfections desc




--- Infection Percentage Over Population Per Country


Select Continent, Location, population, max([Total Cases]) as HighestIfectionCount, (max([Total Cases]) / population)*100 as InfectionPercentage
from dbo.['New Vaccination Data$']
Where continent is not null
group by Continent, Location, population
order by InfectionPercentage desc



--- Infection Percentage Over Population Per Continent


Select Location, population, max([Total Cases]) as HighestIfectionCount, (max([Total Cases]) / population)*100 as InfectionPercentage
from dbo.['New Vaccination Data$']
Where Location in ('Asia', 'Europe', 'North America', 'South America', 'Africa', 'Oceania') 
group by Location, population
order by InfectionPercentage desc




--- Deaths Percentage Over Population per country

Select Continent, Location, population, max([Total Deaths]) as HighestDeathsCount, (max([Total Deaths]) / Population)*100 as DeathsPercentage
from dbo.['New Vaccination Data$']
Where continent is not null
group by Continent, Location, population
order by DeathsPercentage desc


--- Deaths Percentage Over Population per continent

Select Location, population, max([Total Deaths]) as HighestDeathsCount, (max([Total Deaths]) / Population)*100 as DeathsPercentage
from dbo.['New Vaccination Data$']
Where Location in ('Asia', 'Europe', 'North America', 'South America', 'Africa', 'Oceania')
group by Location, population
order by DeathsPercentage desc


--- Global Numbers  

Select max([Total Cases]) as HighestIfectionCount, max([Total Deaths]) as HighestDeathsCount, (max([Total Deaths]) / max([Total Cases]))*100 as GlobalDeathsPercentage
from dbo.['New Vaccination Data$']
order by 1,2


--- The Highest Infections In One Day Per Country


select Continent, Location, max([New Cases]) as HighestInfectionDay 
from dbo.['New Vaccination Data$']
Where continent is not null
group by Continent, Location
order by HighestInfectionDay desc




--- The Highest Deaths In One Day Per Country


select Continent, Location, max([New Deaths]) as HighestDeathsDay 
from dbo.['New Vaccination Data$']
Where continent is not null
group by Continent, Location
order by HighestDeathsDay desc


--- The Highest Deaths In One Day Per Contenet


select Location, max([New Deaths]) as HighestDeathsDay 
from dbo.['New Vaccination Data$']
Where Location in ('Asia', 'Europe', 'North America', 'South America', 'Africa', 'Oceania')
group by Location
order by HighestDeathsDay desc



--- Vaccination Data


select Continent, Location,  Population, [New Vaccinations], [People Vaccinated], [People Fully Vaccinated Per Hundred], [Total Vaccinations]
from dbo.['New Vaccination Data$']
Where continent is not null
group by Continent, Location,  Population, [New Vaccinations], [People Vaccinated], [People Fully Vaccinated Per Hundred], [Total Vaccinations]
order by 1,2



--- People Vaccinated Around The World



select Location, Population, max(convert(numeric,[People Vaccinated])) as PeopleVaccinated ,
(max(cast([People Vaccinated] as numeric)) / Population ) *100 as PercOfPeopleVaccinated
from dbo.['New Vaccination Data$']
Where Location like '%World%'
group by Location, Population  
order by PeopleVaccinated desc


--- People Not Vaccinated Around The World



select Location, Population, (Population - max(cast([People Vaccinated] as numeric))) as PeopleNotVaccinated ,
(Population - max(cast([People Vaccinated] as numeric))) / Population *100 as PercOfPeopleNotVaccinated
from dbo.['New Vaccination Data$']
Where Location like '%World%'
group by Location, Population  
order by PeopleNotVaccinated desc



--- Vaccination Percentage Over Population Per Country


select Continent, Location, Population,  max(convert(numeric,[People Vaccinated])) as TotalVaccine,
(max(convert(numeric,[People Vaccinated])) / Population)*100 As VaccinationPercentage,
(Population - max(cast([People Vaccinated] as numeric))) as PeopleNotVaccinated ,
(Population - max(cast([People Vaccinated] as numeric))) / Population *100 as PercOfPeopleNotVaccinated
from dbo.['New Vaccination Data$']
Where continent is not null
group by Continent, Location, Population  
order by VaccinationPercentage desc



--- Vaccination Percentage Over Population Per Continent


select Location, Population, max(convert(numeric,[People Vaccinated])) as TotalVaccinations ,
(max(convert(numeric,[People Vaccinated])) / Population)*100 As TotalVaccinationsPercentage
from dbo.['New Vaccination Data$']
Where Location in ('Asia', 'Europe', 'North America', 'South America', 'Africa', 'Oceania')
group by Location, Population  
order by TotalVaccinationsPercentage desc






--- Fully Vaccinated vs Partly Vaccinated Over The World


select Location, Population,  max(convert(numeric,[People Vaccinated])) as TotalVaccinations, max(convert(numeric,[People Fully Vaccinated])) as FullyVaccinated,
max(convert(numeric,[People Vaccinated])) - max(convert(numeric,[People Fully Vaccinated])) as PartlyVaccinated
from dbo.['New Vaccination Data$']
Where Location like '%world%'
group by Location, Population
order by 1,2








