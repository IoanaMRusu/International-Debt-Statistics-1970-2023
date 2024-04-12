# International Debt Statistics
In this SQL project we analyzes the international debt data collected by the World Bank. We seek to find total debt owned by conuntries, the country with the highest debt amount and more relevant info, verifing amounts gathered from 1970 to 2023.

<img width="1058" alt="DebtStatProjectOverview" src="https://github.com/IoanaMRusu/International-Debt-Statistics-1970-2023/assets/144055123/deda3015-38c9-41e7-be68-39248b87056a">

# Data
*https://www.worldbank.org/en/programs/debt-statistics/idr/products*

Data is collected from WorldBank - International Debt Report 2023. The International Debt Report (IDR), formerly International Debt Statistics (IDS), is a longstanding annual publication of the World Bank featuring external debt statistics and analysis for the 121 low- and middle-income countries that report to the World Bank Debtor Reporting System (DRS).

<h3 id="International Debt"><code>international_debt</code></h3>
<table>
<thead>
<tr>
<th style="text-align:left;">column</th>
<th>type</th>
<th>meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;"><code>country_name</code></td>
<td>varchar</td>
<td>Name of the country</td>
</tr>
<tr>
<td style="text-align:left;"><code>country_code</code></td>
<td>varchar</td>
<td>Code of the country</td>
</tr>
<tr>
<td style="text-align:left;"><code>indicator_name</code></td>
<td>varchar</td>
<td>Name of the indicator</td>
</tr>
<tr>
<td style="text-align:left;"><code>indicator_code</code></td>
<td>varchar</td>
<td>Code of the indicator</td>
</tr>
<tr>
<td style="text-align:left;"><code>debt_2021</code></td>
<td>numeric</td>
<td>Total Debt of the country in 2021 (USD)</td>
</tr>
<tr>
<td style="text-align:left;"><code>debt_2022</code></td>
<td>numeric</td>
<td>Total Debt of the country in 2022 (USD)</td>
</tr>
<tr>
<td style="text-align:left;"><code>total_debt2023</code></td>
<td>numeric</td>
<td>Total Debt of the country in 2023 (USD)</td>
</tr>
</tbody>
</table>

# Indicator Description

* **DT.AMT.DLXF.CD:** *Principal repayments on long-term debt are actual amounts of principal (amortization) paid by the borrower in currency, goods, or services in the year specified. Long-term external debt is defined as debt that has an original or extended maturity of more than one year and that is owed to nonresidents by residents of an economy and repayable in currency, goods, or services. Data are in current U.S. dollars.*
* **DT.AMT.OFFT.CD:** *Public and publicly guaranteed debt from official creditors includes loans from international organizations (multilateral loans) and loans from governments (bilateral loans). Loans from international organization include loans and credits from the World Bank, regional development banks, and other multilateral and intergovernmental agencies. Excluded are loans from funds administered by an international organization on behalf of a single donor government; these are classified as loans from governments. Government loans include loans from governments and their agencies (including central banks), loans from autonomous bodies, and direct loans from official export credit agencies. Principal repayments are actual amounts of principal (amortization) paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.DIS.DLXF.CD:** *Disbursements on long-term debt are drawings by the borrower on loan commitments during the year specified. Long-term external debt is defined as debt that has an original or extended maturity of more than one year and that is owed to nonresidents by residents of an economy and repayable in currency, goods, or services. Data are in current U.S. dollars.*
* **DT.DIS.OFFT.CD:** *Public and publicly guaranteed debt from official creditors includes loans from international organizations (multilateral loans) and loans from governments (bilateral loans). Loans from international organization include loans and credits from the World Bank, regional development banks, and other multilateral and intergovernmental agencies. Excluded are loans from funds administered by an international organization on behalf of a single donor government; these are classified as loans from governments. Government loans include loans from governments and their agencies (including central banks), loans from autonomous bodies, and direct loans from official export credit agencies. Disbursements are drawings by the borrower on loan commitments during the year specified. Data are in current U.S. dollars.*
* **DT.DIS.BLAT.CD:** *Bilateral debt includes loans from governments and their agencies (including central banks), loans from autonomous bodies, and direct loans from official export credit agencies. Disbursements are drawings by the borrower on loan commitments during the year specified. Data are in current U.S. dollars.*
* **DT.AMT.BLAT.CD:** *Bilateral debt includes loans from governments and their agencies (including central banks), loans from autonomous bodies, and direct loans from official export credit agencies. Principal repayments are actual amounts of principal (amortization) paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.AMT.MLAT.CD:** *Public and publicly guaranteed multilateral loans include loans and credits from the World Bank, regional development banks, and other multilateral and intergovernmental agencies. Excluded are loans from funds administered by an international organization on behalf of a single donor government; these are classified as loans from governments. Principal repayments are actual amounts of principal (amortization) paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.INT.DLXF.CD:** *Interest payments on long-term debt are actual amounts of interest paid by the borrower in currency, goods, or services in the year specified. Long-term external debt is defined as debt that has an original or extended maturity of more than one year and that is owed to nonresidents by residents of an economy and repayable in currency, goods, or services. Data are in current U.S. dollars.*
* **DT.INT.OFFT.CD:** *Public and publicly guaranteed debt from official creditors includes loans from international organizations (multilateral loans) and loans from governments (bilateral loans). Loans from international organization include loans and credits from the World Bank, regional development banks, and other multilateral and intergovernmental agencies. Excluded are loans from funds administered by an international organization on behalf of a single donor government; these are classified as loans from governments. Government loans include loans from governments and their agencies (including central banks), loans from autonomous bodies, and direct loans from official export credit agencies. Interest payments are actual amounts of interest paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.INT.BLAT.CD:** *Bilateral debt includes loans from governments and their agencies (including central banks), loans from autonomous bodies, and direct loans from official export credit agencies. Interest payments are actual amounts of interest paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.INT.MLAT.CD:** *Public and publicly guaranteed multilateral loans include loans and credits from the World Bank, regional development banks, and other multilateral and intergovernmental agencies. Excluded are loans from funds administered by an international organization on behalf of a single donor government; these are classified as loans from governments. Interest payments are actual amounts of interest paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.DIS.MLAT.CD:** *Public and publicly guaranteed multilateral loans include loans and credits from the World Bank, regional development banks, and other multilateral and intergovernmental agencies. Excluded are loans from funds administered by an international organization on behalf of a single donor government; these are classified as loans from governments. Disbursements are drawings by the borrower on loan commitments during the year specified. Data are in current U.S. dollars.*
* **DT.AMT.DPNG.CD:** *Private nonguaranteed external debt is an external obligation of a private debtor that is not guaranteed for repayment by a public entity. Principal repayments are actual amounts of principal (amortization) paid by the borrower in currency, goods, or services in the year specified. Long-term external debt is defined as debt that has an original or extended maturity of more than one year and that is owed to nonresidents by residents of an economy and repayable in currency, goods, or services. Data are in current U.S. dollars.*
* **DT.INT.DPNG.CD:** *Private nonguaranteed external debt is an external obligation of a private debtor that is not guaranteed for repayment by a public entity. Interest payments are actual amounts of interest paid by the borrower in currency, goods, or services in the year specified. Long-term external debt is defined as debt that has an original or extended maturity of more than one year and that is owed to nonresidents and repayable in currency, goods, or services. Data are in current U.S. dollars.*
* **DT.DIS.PCBK.CD:** *Public and publicly guaranteed commercial bank loans from private banks and other private financial institutions. Disbursements are drawings by the borrower on loan commitments during the year specified. Data are in current U.S. dollars.*
* **DT.DIS.PROP.CD:** *Public and publicly guaranteed other private credits from manufacturers, exporters, and other suppliers of goods, and bank credits covered by a guarantee of an export credit agency. Disbursements are drawings by the borrower on loan commitments during the year specified. Data are in current U.S. dollars.*
* **DT.DIS.PRVT.CD:** *Public and publicly guaranteed debt from private creditors include bonds that are either publicly issued or privately placed; commercial bank loans from private banks and other private financial institutions; and other private credits from manufacturers, exporters, and other suppliers of goods, and bank credits covered by a guarantee of an export credit agency. Disbursements are drawings by the borrower on loan commitments during the year specified. Data are in current U.S. dollars.*
* **DT.AMT.PBND.CD:** *Public and publicly guaranteed debt from bonds that are either publicly issued or privately placed. Principal repayments are actual amounts of principal (amortization) paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.AMT.PCBK.CD:** *Public and publicly guaranteed commercial bank loans from private banks and other private financial institutions. Principal repayments are actual amounts of principal (amortization) paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.AMT.PROP.CD:** *Public and publicly guaranteed other private credits from manufacturers, exporters, and other suppliers of goods, and bank credits covered by a guarantee of an export credit agency. Principal repayments are actual amounts of principal (amortization) paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.AMT.PRVT.CD:** *Public and publicly guaranteed debt from private creditors include bonds that are either publicly issued or privately placed; commercial bank loans from private banks and other private financial institutions; and other private credits from manufacturers, exporters, and other suppliers of goods, and bank credits covered by a guarantee of an export credit agency. Principal repayments are actual amounts of principal (amortization) paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.INT.PBND.CD:** *Public and publicly guaranteed debt from bonds that are either publicly issued or privately placed. Interest payments are actual amounts of interest paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.INT.PCBK.CD:** *Public and publicly guaranteed commercial bank loans from private banks and other private financial institutions. Interest payments are actual amounts of interest paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.INT.PROP.CD:** *Public and publicly guaranteed other private credits from manufacturers, exporters, and other suppliers of goods, and bank credits covered by a guarantee of an export credit agency. Interest payments are actual amounts of interest paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*
* **DT.INT.PRVT.CD:** *Public and publicly guaranteed debt from private creditors include bonds that are either publicly issued or privately placed; commercial bank loans from private banks and other private financial institutions; and other private credits from manufacturers, exporters, and other suppliers of goods, and bank credits covered by a guarantee of an export credit agency. Interest payments are actual amounts of interest paid by the borrower in currency, goods, or services in the year specified. Data are in current U.S. dollars.*

# Key Findings

- There are 123 different countries presented in our data and 25 debt indicators available (as it can be seen above in their description).
- China is the country with the highest debt: 498866.22 - USD, followed by Brazil	- 227969.99 USD and India -	217163.45 USD.
- Overall debt of all countries is: 3379458.67 USD
- The highest amount of REPAYMENTS ON EXTERNAL DEBT is also taken by China, follwed again by Brazil and Mexico.
- Other possible economic issues that countries go thorugh are also highlated in our final conclusions.

# Visualization
https://public.tableau.com/app/profile/ioana.rusu2529/viz/InternationalDebtStatistics_17129458033810/Dashboard
