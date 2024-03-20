-- 1. UNDERSTANDING THE DATASET
/* The first line of code connects us to the international_debt database where the table international_debt is residing.
Let's first SELECT all of the columns from the international_debt table. 
Also, we'll limit the output to the first ten rows to keep the output clean. */

SELECT * 
FROM international_debt
WHERE total_debt2023 IS NOT NULL AND country_name NOT IN('South Africa', 'South Asia')
LIMIT 10;

-- 2. FIND THE NUMBER OF DISTINCT COUNTRIES
/* From the first ten rows, we can see the amount of debt owed by Afghanistan in the different debt indicators. 
But we do not know the number of different countries we have on the table.
There are repetitions in the country names because a country is most likely to have debt in more than one debt indicator.
Without a count of unique countries, we will not be able to perform our statistical analyses holistically. 
In this section, we are going to extract the number of unique countries present in the table. */

SELECT * FROM international_debt;
SELECT COUNT(DISTINCT(country_name)) AS total_distinct_country
FROM international_debt;

-- 3. FIND THE DISTINCT DEBT INDICATORS
/* We can see there are a total of 123 countries present on the table. As we saw in the first section, there 
is a column called indicator_name that briefly specifies the purpose of taking the debt. 
Just beside that column, there is another column called indicator_code which symbolises the category of these debts.
Knowing about these various debt indicators will help us to understand the areas in which a country can possibly 
be indebted to. */

SELECT DISTINCT(indicator_code) AS distinct_debt_indicators
FROM international_debt
GROUP BY distinct_debt_indicators
ORDER BY distinct_debt_indicators;

--4. DEBTS BY COUNTRY
/* The financial debt of a country represents its economic state. Let's take a look on how countries are holding up
and their economies.*/

SELECT country_name, ROUND(SUM(total_debt2023)/1000000, 2) AS total_debt
FROM international_debt
WHERE country_name NOT IN('South Africa', 'South Asia')
GROUP BY country_name
ORDER BY total_debt DESC;

--5. AMOUNT OF DEBT OWED BY ALL COUNTIES IN 2023
/* As mentioned earlier, the financial debt of a particular country represents its economic state. 
But if we were to project this on an overall global scale, how will we approach it?
Let's switch gears from the debt indicators now and find out the total amount of debt (in USD) that is owed 
by the different countries. 
This will give us a sense of how the overall economy of the entire world is holding up. */

SELECT ROUND (SUM(total_debt2023)/1000000, 2) AS total_debt
FROM international_debt
WHERE country_name NOT IN('South Africa', 'South Asia');

--6.TOP 10 COUNTRIES WITH DEBTS
/* "Blessed are the young for they shall inherit the national debt." -Herbert Hoover
Now that we have the exact total of the amounts of debt owed by several countries,  let's now find out the countries 
that own the highest amount of debt along with the amount. 
Note that this debt is the sum of different debts owed by a country across several categories. 
This will help to understand more about the country in terms of its socio-economic scenarios. */

SELECT country_name, ROUND(SUM(total_debt2023)/1000000, 2) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 10;

--7. COUNTRIES WITH LOWEST DEBTS (TOP 10)
/* As we saw earlier, China is the country with the highest debt. Now let's verify the countries that have the
lowest ammount of debt*/

SELECT country_name, ROUND(SUM(total_debt2023)/1000000, 2) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt ASC
LIMIT 10;

--8. AVERAGE AMOUNT OF DEBT ACROSS INDICATORS
/* We now have a brief overview of the dataset and a few of its summary statistics.  We already have an idea of the 
different debt indicators in which the countries owe their debts. 
We can dig even further to find out on an average how much debt a country owes? 
This will give us a better sense of the distribution of the amount of debt across different indicators. */

SELECT indicator_code as debt_indicator, ROUND(AVG(total_debt2023)/1000000,2) AS average_debt, indicator_name
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 10;

--9. HIGHEST AMOUNT OF PRINCIPAL REPAYMENTS ON EXTERNAL DEBT
/* We can see that the indicator DT.AMT.DLXF.CD tops the chart of average debt. This category includes repayment 
of long term debts. 
Countries take on long-term debt to acquire immediate capital. More information about this category can be found here.
An interesting observation in the above finding is that there is a huge difference in the amounts of the indicators 
after the second one. 
This indicates that the first two indicators might be the most severe categories in which the countries owe their debts.
We can investigate this a bit more so as to find out which country owes the highest amount of debt in the category 
of long term debts (DT.AMT.DLXF.CD). 
Since not all the countries suffer from the same kind of economic disturbances, 
this finding will allow us to understand that particular country's economic condition a bit more specifically. */

SELECT country_name, ROUND(AVG(total_debt2023)/1000000,2) AS average_debt, indicator_name,
indicator_code
FROM international_debt
WHERE country_name NOT IN('South Africa', 'South Asia')
GROUP BY country_name, indicator_name, indicator_code
HAVING indicator_code = 'DT.AMT.DLXF.CD'
ORDER BY average_debt DESC
LIMIT 10;

--10. THE MOST COMMON DEBT INDICATORS
/* China has the highest amount of debt in the long-term debt (DT.AMT.DLXF.CD) category. This is verified by The World Bank. 
It is often a good idea to verify our analyses like this since it validates that our investigations are correct.
We saw that long-term debt is the topmost category when it comes to the average amount of debt. 
But is it the most common indicator in which the countries owe their debt? Let's find that out. */

SELECT indicator_name, indicator_code, COUNT(indicator_code) AS indicator_count, ROUND(SUM(total_debt2023)/1000000, 2) AS total_debt
FROM international_debt
WHERE total_debt2023 IS NOT NULL
GROUP BY indicator_code, indicator_name
ORDER BY indicator_count DESC
LIMIT 20;

--11. OTHER DEBT ISSUES AND CONCLUSIONS
/* There are a total of six debt indicators in which all the countries listed in our dataset have taken debt. 
The indicator DT.AMT.DLXF.CD is also there in the list. So, this gives us a clue that all these countries are suffering 
from a common economic issue. But that is not the end of the story, a part of the story rather.
Let's change tracks from debt_indicators now and focus on the amount of debt again. 
Let's find out the maximum amount of debt across the indicators along with the respective country names. 
With this, we will be in a position to identify the other plausible economic issues a country might be going through. 
By the end of this section, we will have found out the debt indicators in which a country owes its highest debt.
we took a look at debt owed by countries across the globe. 
We extracted a few summary statistics from the data and unravelled some interesting facts and figures.*/

SELECT country_name, indicator_name, max(total_debt2023) as maximum_debt
FROM international_debt
WHERE total_debt2023 IS NOT NULL
GROUP BY country_name, indicator_name
ORDER BY maximum_debt DESC
LIMIT 20;
