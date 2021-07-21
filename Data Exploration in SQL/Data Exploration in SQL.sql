/*
Covid 19 Data Exploration 
*/

Select *
From Portfolio_projects..Covid19_deaths$
Where continent is not null 
order by 3,4


-- Select Data going to be used 

Select Location, date, total_cases, new_cases, total_deaths, population
From Portfolio_projects..Covid19_deaths$
Where continent is not null 
order by 1,2


-- Total Cases vs Total Deaths in Ireland from Jan 2020 to  July 2021
--Death Percentage (means higher the percentage the more risk of dying if you contract covid in USA) 

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Portfolio_projects..Covid19_deaths$
Where location = 'Ireland'
and continent is not null 
order by 1,2


-- Total Cases vs Population for each country
-- percentage of population infected with Covid in each country

Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From Portfolio_projects..Covid19_deaths$
order by 1,2


-- Countries with Highest Infection Rate compared to Population

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From Portfolio_projects..Covid19_deaths$
Group by Location, Population
order by PercentPopulationInfected desc


-- Countries with Highest Death Count per Population

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Portfolio_projects..Covid19_deaths$
Where continent is not null 
Group by Location
order by TotalDeathCount desc




-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Portfolio_projects..Covid19_deaths$
Where continent is not null 
Group by continent
order by TotalDeathCount desc



-- total cases day by day around the world 

Select date,  SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From Portfolio_projects..Covid19_deaths$
where continent is not null 
Group By date
order by 1,2



-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From Portfolio_projects..Covid19_deaths$ dea
Join Portfolio_projects..Covid19_Vaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3


-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated,
(RollingPeopleVaccinated/population)*100
From Portfolio_projects..Covid19_deaths$ dea
Join Portfolio_projects..Covid19_Vaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac



-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
, (RollingPeopleVaccinated/population)*100
From Portfolio_projects..Covid19_deaths$ dea
Join Portfolio_projects..Covid19_Vaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated




-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From Portfolio_projects..Covid19_deaths$ dea
Join Portfolio_projects..v vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 

