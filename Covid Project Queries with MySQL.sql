--Select *  From CovidDeaths

Select Count(*) From CovidVaccinations
Select Count(*) From CovidDeaths

-- Calculate total cases vs death as percentage 
-- Likelihood of dying in a specific country
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Covid_Project..CovidDeaths
Order by 1, 2

-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

Select Location, date, total_cases, population, (total_cases/population)*100 as PopPercentwtVirus
From Covid_Project..CovidDeaths
Where location = 'Canada'
Order by 1, 2

-- Countries with Highest Infection Rate compared to Population

Select Location, population, MAX(total_cases) as HighestInfectionCount, 
MAX((total_cases/population)*100) as PopPercentInfected
From Covid_Project..CovidDeaths
Group by Location, population
Order by PopPercentInfected DESC

-- Countries with Highest Death Count per Population
Select location, MAX(total_cases) as TotalCases, Max(total_deaths) as TotalDeaths
From CovidDeaths
Where continent is not null
Group by location
Order by TotalDeaths DESC

-- Contintents with the highest death count per population
Select continent, MAX(total_cases)as TotalCases, Max(total_deaths) as TotalDeaths
From CovidDeaths
Where continent is not null
Group by continent
Order by TotalDeaths DESC

-- GLOBAL 

Select SUM(new_cases) as GlobalNewCaseCount, SUM(new_deaths) as GlobalNewDeathCount, 
		SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
From CovidDeaths
Where continent is not null
--Group by date
--Order by 1,2
--Order by DeathPercentage DESC

-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
-- Calculate Rolling people vaccinated


Select dea.continent, dea.location, dea.date, population, new_vaccinations, 
	SUM(new_vaccinations) OVER (Partition BY dea.location Order by (cast(dea.location as varchar(50))), (cast(dea.date as varchar(50))))
	as RollingVaccinationbyLoc
From CovidDeaths as dea
Join CovidVaccinations as vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null 
and dea.location = 'Albania'
Order by dea.location, dea.date

-- Using CTE to perform Calculation on Partition By in previous query
With Pop_Vacc (continent, location, date, population, new_vaccinations, RollingVaccinationbyLoc)
as 
(Select dea.continent, dea.location, dea.date, population, new_vaccinations, 
	SUM(new_vaccinations) OVER (Partition BY dea.location Order by (cast(dea.location as varchar(50))), (cast(dea.date as varchar(50))))
	as RollingVaccinationbyLoc
From CovidDeaths as dea
Join CovidVaccinations as vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null 
)
Select *, (RollingVaccinationbyLoc/population)*100 as RollingPopVaccinated
From Pop_Vacc


--Create Temp Table
DROP Table if exists #RollingPopVacc
Create Table #RollingPopVacc
(Continent varchar(255),
Location varchar(255),
Date date,
Population float,
New_vaccinations numeric,
RollingVaccinationbyLoc numeric
)

Insert into #RollingPopVacc
Select dea.continent, dea.location, dea.date, population, new_vaccinations, 
	SUM(new_vaccinations) OVER (Partition BY dea.location Order by (cast(dea.location as varchar(50))), (cast(dea.date as varchar(50))))
	as RollingVaccinationbyLoc
From CovidDeaths as dea
Join CovidVaccinations as vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null 
--Order by dea.location, dea.date

Select *, (RollingVaccinationbyLoc/Population)*100 as RollingPopVaccinated
From #RollingPopVacc
where location = 'Albania'

-- Creating View to store data for later visualizations
Create View PercentPopVaccinated as
Select dea.continent, dea.location, dea.date, population, new_vaccinations, 
	SUM(new_vaccinations) OVER (Partition BY dea.location Order by (cast(dea.location as varchar(50))), (cast(dea.date as varchar(50))))
	as RollingVaccinationbyLoc
From CovidDeaths as dea
Join CovidVaccinations as vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null 

Create View HighestInfectionCount as
Select Location, population, MAX(total_cases) as HighestInfectionCount, 
MAX((total_cases/population)*100) as PopPercentInfected
From Covid_Project..CovidDeaths
Group by Location, population
--Order by PopPercentInfected DESC