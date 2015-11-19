#delimit;
set more 1;

clear all;

infile year inactiveh dbank wtp wealth aincb sesinc secondary_edu urban using kdata.txt;

drop if inactiveh==1;

drop if sesinc==0;

outsheet using kdata2.csv, noname comma replace;

preserve;
drop if urban==1;
outsheet using kdataRur.csv, noname comma replace;
restore;

preserve;
drop if urban==0;
outsheet using kdataUrb.csv, noname comma replace;
restore;

preserve;
drop if secondary_edu==1;
outsheet using kdataLedu.csv, noname comma replace;
restore;

preserve;
drop if secondary_edu==0;
outsheet using kdataHedu.csv, noname comma replace;
restore;


/* Comments on Variables

There are 9 variables in kdata, ordered as follows from left to right
columns:

	year  inactiveh  dbank  wtp  wealth  aincb  sesinc secondary_edu  urban

Each variable is about:

1. year  : calendar year, from 1976 to 1996.

2. inactiveh=1 if households are economically inactive (i.e., getting no earned income),
   0 otherwise.

3. dbank=1 if the household used last month any of the following formal financial 
   institutions: commercial banks, savings banks, Bank for Agriculture & Agricultural 
   Cooperative (BAAC), government housing banks, financial companies, and credit financiers.

4. wtp: sampling weight. (use this to get sample statistics)

5. wealth: wealth measure combining the principal-component analysis and rental income analysis.

6. aincb: annual value of broad (all-inclusive) income.

7. sesinc: annual value of earned income (wage or profits) plus financial income. This is the 
   income measure used in the paper. Note that this should be missing for the inactive households.

8. secondary_edu=1 if final attainment of schooling is secondary level or above, 0 if primary or below.

9. urban=1 if the community type is urban, 0 otherwise.

*/


