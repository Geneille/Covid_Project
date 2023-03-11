# Covid_Project
Evaluating Covid19 cases and vaccinations with MySQL

The first part of this project aimed to perform some EDA for deaths and vaccinations related to Covid 19 using SQL. The data source and SQL script is provided. In general 259,643 rows of data was imported from the csv file.

Figure 1 below provides a snapshot of the likelihood of dying in a specific country.

<img width="419" alt="Figure1_1" src="https://user-images.githubusercontent.com/92636438/224492092-7e36e917-15e2-4dce-9bf1-cffb60c27c18.png">


Figure 2 shows the countries with highest infection rate.

<img width="301" alt="Figure2_2" src="https://user-images.githubusercontent.com/92636438/224492226-6025a7f8-fa66-48d5-bea7-02caee1c60f6.png">

Figure 3 below show contintents with the highest death count per population

<img width="364" alt="Figure3-3" src="https://user-images.githubusercontent.com/92636438/224492346-0683bae5-add1-4694-a077-554628d95d62.png">

A rolling vaccination count and percent vaccinated by location was calucated. The query to store the data for calculation was done in a temporary table. The results is displayed in the Figure below. 

<img width="525" alt="Figure5-5" src="https://user-images.githubusercontent.com/92636438/224492661-bcd73052-d454-4ca0-9387-b2f7e3d580e8.png">

