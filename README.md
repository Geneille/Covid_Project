# Covid_Project
Evaluating Covid-19 cases and death counts and vaccination rollout with SQL & Tableau

## About the Data

Data Source: https://ourworldindata.org/covid-vaccinations
* In general 259,643 rows of data was imported from two csv files. 
* The data ranges from 2020 to 2023 for 248 countries (MySql - Select Count (Distinct location) As NumberofCountries
From CovidDeaths)

## Part 1 Data exploration with MySql

The first part of this project aimed to perform some EDA for deaths and vaccinations related to Covid 19 using SQL. The SQL script is provided. 

The Figure below shows checking specific columns for null values. 

Preview of queries:

* SQL query of the likelihood of dying in a specific country.

<img width="419" alt="Figure1_1" src="https://user-images.githubusercontent.com/92636438/224492092-7e36e917-15e2-4dce-9bf1-cffb60c27c18.png">

* SQL query for the countries with highest infection rate.

<img width="301" alt="Figure2_2" src="https://user-images.githubusercontent.com/92636438/224492226-6025a7f8-fa66-48d5-bea7-02caee1c60f6.png">

* SQL query for continents with the highest death count per population

<img width="364" alt="Figure3-3" src="https://user-images.githubusercontent.com/92636438/224492346-0683bae5-add1-4694-a077-554628d95d62.png">

* Rolling vaccination count and percent vaccinated by location was calucated. The query to store the data for calculation was done in a temporary table.

<img width="525" alt="Figure5-5" src="https://user-images.githubusercontent.com/92636438/224492661-bcd73052-d454-4ca0-9387-b2f7e3d580e8.png">

## Part 2 Creating Interactive Dashboards
After the Data was cleaned and explored, two interactive dashboards were created in Tableau

Link to cases and deaths dashboard: 
https://public.tableau.com/app/profile/geneille.greaves/viz/GLOBALCOVID-19CASESDEATHSTATISTICS/Dashboard3

Preview

Link to vaccination rollout dashboard:
https://public.tableau.com/app/profile/geneille.greaves/viz/COVID-19VACCINATIONSTATISTICS/Dashboard22

Preview
