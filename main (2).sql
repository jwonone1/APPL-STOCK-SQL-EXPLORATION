-- Exploring the appple stock price dataset that was pulled from google finance in january 2014.

SELECT * FROM tutorial.aapl_historical_stock_price;	 

-- I would like to see the total number of row in this dataset. 

 SELECT COUNT(*) as total_number_of_row  FROM tutorial.aapl_historical_stock_price;
 
-- The total number of row is 3555.

-- I would like to look at the year 2012.

 SELECT * FROM tutorial.aapl_historical_stock_price
 WHERE year = 2012;
 
 -- I want the highest and lowest price out of the year 2012.
 
 SELECT year, max(high) as year_high, min(low) as year_low FROM tutorial.aapl_historical_stock_price
 WHERE year = 2012
 GROUP BY year;
 
 -- Out of the year 2012 the max price was 705.07 and the lowest was 409.
 
 
-- I want to know what date were those two.

 SELECT date FROM tutorial.aapl_historical_stock_price
 WHERE high = 705.07; 

 -- 9/21/12 near the end of the year.
 
  SELECT date FROM tutorial.aapl_historical_stock_price
 WHERE low = 409;
 
 -- 1/3/12 at the start of the year.
 
 -- I want to see all the prices where the high was over 500 along with date and month.
 
 select year, month, date,  high,
 CASE WHEN high >= 500 THEN 'over or equal to 500'
 ELSE 'less then 500' END AS high_price_group
 FROM tutorial.aapl_historical_stock_price
 WHERE year = 2012
 GROUP BY 1,2,3,4;
 
 -- It looks like after 3/1/2012 the price remain 500 or more for the rest of the year.

-- Now im going to look at the volume for the year 2012.

SELECT year, month, date, volume FROM tutorial.aapl_historical_stock_price
WHERE year =2012

-- I can see the year, month,  date, and volume for each day they traded.

-- What's  the grand total of the volume for the year 2012.

SELECT year, sum(volume) FROM tutorial.aapl_historical_stock_price
WHERE year =2012
GROUP BY 1

-- The number of shares traded for the year(volume) is 4,692,550,283

-- This was a simple project of data exploration using appple stock dataset